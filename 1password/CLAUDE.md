## 1Password Skills

This collection provides two skills for securely managing credentials through 1Password.

### 1password:environments
Use when handling:
- Project `.env` files or environment variables
- 1Password Environments import, audit, or sync
- Provider secrets (Netlify, Cloudflare, Vercel)
- Local runtime injection via `op run --environment`
- Infrastructure secret creation
- 1Password MCP server setup

Trigger phrase examples:
- "import this project's .env into 1Password"
- "sync 1Password to Netlify production"
- "check if Cloudflare is in sync"
- "generate a new database password"

### 1password:ssh-git
Use when handling:
- Generating a new SSH keypair stored in 1Password
- Registering an SSH key with GitHub or GitLab
- Configuring Git commit signing via 1Password SSH key
- Setting up SSH server access via the 1Password SSH agent

Trigger phrase examples:
- "generate an SSH key and store it in 1Password"
- "add my 1Password SSH key to GitHub"
- "sign my commits with 1Password"
- "connect to this server using 1Password SSH"
