alias gpt='git push && git push --tags'
alias nrd='npm run dev'
alias ns='npm start'
alias ni='npm install'
alias nt='npm test'
alias nr='npm run'
alias nrf='npm run format'
alias nrl='npm run lint'
alias nrb='npm run build'
alias nrtc='npm run typecheck'
alias ncu='npx npm-check-updates'
alias ollama='docker exec -it ollama ollama'

hub() {
    if [ -z "$1" ]; then
        echo "Usage: hub <user>/<repo> or hub <repo>"
        return 1
    fi
    
    if [[ "$1" == *"/"* ]]; then
        xdg-open "https://github.com/$1"
    else
        xdg-open "https://github.com/iamkaf/$1"
    fi
}

kaf() {
    cat <<'EOF'
╔════════════════════════════════════════════════════════════╗
║                      Kaf Aliases                           ║
╚════════════════════════════════════════════════════════════╝

Git:
  gpt    git push && git push --tags

GitHub:
  hub    hub <user>/<repo> or hub <repo> - Open GitHub repo in browser
         (defaults to iamkaf/<repo>)

NPM:
  nrd    npm run dev
  ns     npm start
  ni     npm install
  nt     npm test
  nr     npm run
  nrf    npm run format
  nrl    npm run lint
  nrb    npm run build
  nrtc   npm run typecheck
  ncu    npx npm-check-updates

Docker:
  ollama docker exec -it ollama ollama
EOF
}