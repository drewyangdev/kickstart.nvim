-- AI code completion via virtual text (ghost text shown inline as you type).
-- Default provider is Claude — set ANTHROPIC_API_KEY in your shell env.
-- To switch provider, change `provider = 'claude'` below to one of:
--   'claude' | 'openai' | 'gemini' | 'codestral' | 'openai_fim_compatible' | 'openai_compatible'
-- Each provider needs its own API key env var (see `api_key = ...` below).

---@module 'lazy'
---@type LazySpec
return {
  'milanglacier/minuet-ai.nvim',
  event = 'InsertEnter',
  config = function()
    require('minuet').setup {
      provider = 'claude',

      provider_options = {
        claude = {
          max_tokens = 256,
          model = 'claude-haiku-4-5',
          stream = true,
          api_key = 'ANTHROPIC_API_KEY',
          end_point = 'https://api.anthropic.com/v1/messages',
          optional = {
            -- pass any additional Anthropic API params here
            -- e.g. stop_sequences = { '\n\n' },
          },
        },

        openai = {
          model = 'gpt-4o-mini',
          end_point = 'https://api.openai.com/v1/chat/completions',
          api_key = 'OPENAI_API_KEY',
          stream = true,
          optional = {
            max_completion_tokens = 256,
            -- reasoning_effort = 'none',
          },
        },

        gemini = {
          model = 'gemini-2.0-flash',
          api_key = 'GEMINI_API_KEY',
          end_point = 'https://generativelanguage.googleapis.com/v1beta/models',
          stream = true,
          optional = {
            generationConfig = {
              maxOutputTokens = 256,
            },
            safetySettings = {
              { category = 'HARM_CATEGORY_DANGEROUS_CONTENT', threshold = 'BLOCK_ONLY_HIGH' },
            },
          },
        },

        -- Fill-In-the-Middle provider — purpose-built for code completion.
        -- Codestral (Mistral) is the default FIM choice; get a key at https://console.mistral.ai/codestral
        codestral = {
          model = 'codestral-latest',
          end_point = 'https://codestral.mistral.ai/v1/fim/completions',
          api_key = 'CODESTRAL_API_KEY',
          stream = true,
          optional = {
            max_tokens = 256,
            stop = { '\n\n' },
          },
        },

        -- Generic OpenAI-compatible chat endpoint (OpenRouter, Groq, local servers, etc.)
        openai_compatible = {
          model = 'meta-llama/llama-3.3-70b-instruct',
          end_point = 'https://openrouter.ai/api/v1/chat/completions',
          api_key = 'OPENROUTER_API_KEY',
          name = 'Openrouter',
          stream = true,
          optional = {
            max_tokens = 256,
            top_p = 0.9,
          },
        },

        -- Generic OpenAI-compatible FIM endpoint (DeepSeek, Ollama, etc.)
        openai_fim_compatible = {
          model = 'deepseek-chat',
          end_point = 'https://api.deepseek.com/beta/completions',
          api_key = 'DEEPSEEK_API_KEY',
          name = 'Deepseek',
          stream = true,
          optional = {
            max_tokens = 256,
            stop = { '\n\n' },
          },
        },
      },

      virtualtext = {
        -- Filetypes where suggestions auto-appear as you type.
        -- These cover the source/config files used in ~/work/arizetree/arize, plus lua for nvim config.
        -- To disable auto-trigger entirely, set to `{}` and invoke manually with `:Minuet virtualtext`.
        auto_trigger_ft = {
          -- Source code
          'lua',
          'go',
          'python',
          'typescript',
          'typescriptreact',
          'javascript',
          'javascriptreact',
          'java',
          'sh',
          'bash',
          'sql',
          'proto',
          'rego',
          'r',
          'rmd',
          -- Web / markup
          'html',
          'css',
          'scss',
          'xml',
          'graphql',
          -- Config / IaC
          'json',
          'jsonc',
          'yaml',
          'toml',
          'terraform',
          'hcl',
          'bzl', -- Bazel BUILD, .bzl, .bazel
          -- Docs
          'markdown',
          'mdx',
          'rst',
        },

        -- Keymaps active when a ghost-text suggestion is visible:
        -- <A-...> means hold Alt (Option on macOS) + key.
        keymap = {
          accept = '<A-tab>',         -- Accept the entire suggestion
          accept_line = '<A-a>',    -- Accept just the next line
          accept_n_lines = '<A-z>', -- Prompts for N, accepts that many lines
          prev = '<A-[>',           -- Cycle to previous suggestion
          next = '<A-]>',           -- Cycle to next suggestion
          dismiss = '<A-e>',        -- Dismiss current suggestion
        },
      },
    }
  end,
}
