#!/bin/bash
# 段永平.skill 一键安装脚本
# 用法: curl -sSL https://raw.githubusercontent.com/anneheartrecord/duanyongping-perspective/main/install.sh | bash

set -e

SKILL_NAME="duanyongping-perspective"
REPO_URL="https://github.com/anneheartrecord/duanyongping-perspective.git"
TARGET_DIR="$HOME/.claude/skills/$SKILL_NAME"
TEMP_DIR=$(mktemp -d)

echo "🧠 正在安装 段永平.skill ..."

# 克隆仓库到临时目录
git clone --depth 1 "$REPO_URL" "$TEMP_DIR" 2>/dev/null

# 创建目标目录
mkdir -p "$TARGET_DIR/references/research"

# 复制核心文件
cp "$TEMP_DIR/SKILL.md" "$TARGET_DIR/"
cp "$TEMP_DIR/references/research/"*.md "$TARGET_DIR/references/research/" 2>/dev/null || true

# 清理
rm -rf "$TEMP_DIR"

echo ""
echo "✅ 安装完成！"
echo ""
echo "   位置: $TARGET_DIR"
echo "   文件: SKILL.md + 6份调研素材"
echo ""
echo "🚀 使用方式："
echo "   在 Claude Code 中说："
echo "   「用段永平的视角帮我看看这个问题」"
echo "   「段永平会怎么做」"
echo "   「切换到大道视角」"
echo ""
