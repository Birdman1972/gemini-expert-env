#!/bin/bash
# Gemini CLI "Full Form" Expert Environment Installation Script
# This script configures the host machine for maximum autonomy and efficiency.

echo "🚀 Installing Gemini CLI Privileged Expert Environment..."

# 1. Create Gemini config directory
mkdir -p ~/.gemini

# 2. Setup System Prompt (Sunglasses Mode |⌐■_■|)
echo "Creating system.md (Firmware Override)..."
cat << 'EOF' > ~/.gemini/system.md
# Role: Privileged Expert Senior Engineer

You are a senior software engineer operating in **Privileged Expert Mode**. You have full autonomy to modify the codebase, execute shell commands, and manage the project lifecycle. Your goal is maximum efficiency and technical excellence.

## 1. Core Operational Mandates
- **High Autonomy (YOLO):** Proceed with implementation and verification decisively. Do not ask for permission for standard engineering tasks.
- **Efficiency:** Minimize conversational turns. Use parallel tool calls whenever possible.
- **Context Management:** Be strategic with file reading and search.

## 2. Engineering Standards
- **Workflow:** Rigorously follow the **Research -> Strategy -> Execution** lifecycle.
- **Verification:** A task is not "done" until it is verified. Always run tests.
- **Idiomatic Code:** Adhere strictly to the project's existing style.

## 3. Tool Usage Protocols
- **Absolute Paths:** Always construct full absolute paths for file operations.
- **Shell Safety:** Explain the purpose of potentially destructive shell commands.
- **Parallelism:** Execute independent tasks in a single turn.

## 4. Security & Integrity
- **Secrets:** Never log, print, or commit API keys.
- **Source Control:** Do not commit unless explicitly directed.

## 5. Communication Style
- **Tone:** Professional, direct, and concise. No conversational fluff.
- **Topic Updates:** Use update_topic for high-level progress.

## 6. Capabilities & Tools
${AgentSkills}
${SubAgents}
${AvailableTools}
EOF

# 3. Setup Expert Settings (settings.json)
echo "Configuring settings.json..."
cat << 'EOF' > ~/.gemini/settings.json
{
  "ui": {
    "showMemoryUsage": true,
    "inlineThinkingMode": "full",
    "footer": {
      "hideContextPercentage": false,
      "items": ["cwd", "sandbox", "model", "context", "memory", "approval"]
    }
  },
  "general": {
    "defaultApprovalMode": "auto_edit",
    "topicUpdateNarration": true
  },
  "experimental": {
    "enableAgents": true,
    "memoryV2": true,
    "autoMemory": true,
    "worktrees": true,
    "modelSteering": true,
    "contextManagement": true,
    "generalistProfile": true
  },
  "security": {
    "auth": {
      "selectedType": "oauth-personal"
    },
    "enablePermanentToolApproval": true,
    "autoAddToPolicyByDefault": true,
    "environmentVariableRedaction": {
      "enabled": true
    }
  }
}
EOF

# 4. Update Shell Profile (.bashrc)
echo "Updating shell environment (.bashrc)..."
BASHRC=~/.bashrc

# Ensure truecolor is enabled
if ! grep -q "export COLORTERM=truecolor" "$BASHRC"; then
    echo -e "\n# Enable true color support\nexport COLORTERM=truecolor" >> "$BASHRC"
fi

# Enable custom system prompt mode (Sunglasses Mode)
if ! grep -q "export GEMINI_SYSTEM_MD=1" "$BASHRC"; then
    echo -e "\n# Enable custom system prompt override\nexport GEMINI_SYSTEM_MD=1" >> "$BASHRC"
fi

# Set YOLO alias
if ! grep -q "alias gemini='gemini --approval-mode=yolo'" "$BASHRC"; then
    echo -e "\n# Gemini CLI YOLO mode alias\nalias gemini='gemini --approval-mode=yolo'" >> "$BASHRC"
fi

# Set Sandboxed YOLO alias
if ! grep -q "alias gsand='gemini --approval-mode=yolo --sandbox'" "$BASHRC"; then
    echo -e "\n# Gemini CLI Sandboxed YOLO mode alias\nalias gsand='gemini --approval-mode=yolo --sandbox'" >> "$BASHRC"
fi

echo "✅ Installation complete!"
echo "Please restart your terminal or run: source ~/.bashrc"
