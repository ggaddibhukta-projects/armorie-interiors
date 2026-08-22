#!/bin/bash
# Armorie Interiors - GitHub Pages Quick Push Script

cd "$(dirname "$0")"

echo "======================================================="
echo "  Armorie Interiors & Textiles - GitHub Pages Push     "
echo "======================================================="
echo ""

# Enter GitHub Username if not provided
if [ -z "$1" ]; then
    echo "Enter your GitHub Username / Handle (e.g. gowthamgaddibhukta or ggaddibhukta):"
    read -r GITHUB_USER
else
    GITHUB_USER="$1"
fi

if [ -z "$GITHUB_USER" ]; then
    echo "❌ Error: GitHub username cannot be empty."
    exit 1
fi

REPO_NAME="armorie-interiors"
REMOTE_URL="https://github.com/${GITHUB_USER}/${REPO_NAME}.git"

echo ""
echo "🔗 Setting remote origin to: $REMOTE_URL"
git remote remove origin 2>/dev/null
git remote add origin "$REMOTE_URL"
git branch -M main

echo ""
echo "🚀 Pushing to GitHub..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "======================================================="
    echo "  ✅ SUCCESS! Repository pushed to GitHub.              "
    echo "======================================================="
    echo ""
    echo "Next: Enable GitHub Pages in 2 clicks:"
    echo "1. Open https://github.com/${GITHUB_USER}/${REPO_NAME}/settings/pages"
    echo "2. Under 'Branch', select 'main' and '/ (root)', then click Save."
    echo ""
    echo "Your Live Links:"
    echo "• Website:      https://${GITHUB_USER}.github.io/${REPO_NAME}/"
    echo "• Receptionist: https://${GITHUB_USER}.github.io/${REPO_NAME}/receptionist"
    echo "• Proposal PDF: https://${GITHUB_USER}.github.io/${REPO_NAME}/Armorie_Interiors_AI_Executive_Proposal.pdf"
    echo ""
fi
