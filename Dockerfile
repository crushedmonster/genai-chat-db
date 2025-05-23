FROM debian:bullseye-slim

ENV DEBIAN_FRONTEND=noninteractive

ARG NON_ROOT_USER="appuser"
ARG NON_ROOT_UID="2222"
ARG NON_ROOT_GID="2222"
ARG HOME_DIR="/home/${NON_ROOT_USER}"

ARG REPO_DIR="."

ARG CONDA_ENV_FILE="conda-env.yaml"
ARG CONDA_ENV_NAME="genai-chat-db"
ARG CONDA_HOME="${HOME_DIR}/miniconda3"
ARG CONDA_BIN="$CONDA_HOME/bin/conda"
ARG MINI_CONDA_SH="Miniconda3-latest-Linux-x86_64.sh"

RUN useradd -l -m -s /bin/bash -u ${NON_ROOT_UID} ${NON_ROOT_USER}

RUN apt-get update && \
    apt-get install -y curl gnupg unixodbc && \
    curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl https://packages.microsoft.com/config/debian/11/prod.list > /etc/apt/sources.list.d/mssql-release.list && \
    apt-get update && \
    ACCEPT_EULA=Y apt-get install -y msodbcsql18 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ENV PYTHONIOENCODING=utf8
ENV LANG="C.UTF-8"
ENV LC_ALL="C.UTF-8"

USER ${NON_ROOT_USER}
WORKDIR ${HOME_DIR}

COPY --chown=${NON_ROOT_USER}:${NON_ROOT_GID} ${REPO_DIR} ${HOME_DIR}

# Install Miniconda
RUN curl -O https://repo.anaconda.com/miniconda/$MINI_CONDA_SH && \
    chmod +x $MINI_CONDA_SH && \
    ./$MINI_CONDA_SH -u -b -p $CONDA_HOME && \
    rm $MINI_CONDA_SH
    
ENV PATH $CONDA_HOME/bin:$HOME_DIR/.local/bin:$PATH

# Install conda environment
RUN $CONDA_BIN env create -f ${HOME_DIR}/$CONDA_ENV_FILE && \
    $CONDA_BIN init bash && \
    $CONDA_BIN clean -a -y && \
    echo "source activate $CONDA_ENV_NAME" >> "$HOME_DIR/.bashrc"

ENV CONDA_ENV_NAME=${CONDA_ENV_NAME}

# Expose Streamlit port
EXPOSE 8501

RUN chmod +x ${HOME_DIR}/scripts/streamlit-entrypoint.sh

CMD ["/bin/bash", "./scripts/streamlit-entrypoint.sh"]