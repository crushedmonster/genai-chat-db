# Azure OpenAI

**Official Docs:** [Azure OpenAI Service Documentation](https://learn.microsoft.com/en-us/azure/ai-services/openai/overview)

**Setup Steps:**
1. Go to [Azure Portal](https://portal.azure.com/).
2. Create a new **Azure OpenAI** resource.
3. Choose a supported region where `GPT-4o` is available (e.g., East US). You can check model availability [here](https://learn.microsoft.com/en-us/azure/ai-services/openai/concepts/models?tabs=global-standard%2Cstandard-chat-completions#standard-deployment-regional-models-by-endpoint).
4. After creation, navigate to your resource and go to **Keys and Endpoint** in the left-hand menu and note:
   - **Endpoint URL**
   - **Key**
5. Go to the [Azure AI Foundry Portal](https://ai.azure.com/), then navigate to **Deployments**.
6. Click **"Deploy model"**, and select **Deploy base model**:
   - **Model**: `gpt-4o` (or choose another available model like `gpt-4` or `gpt-35-turbo`)
   - **Deployment name**: e.g., `gpt-4o`
   - **Model version**: Use the default
