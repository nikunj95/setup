commitlint() {
    echo "Installing commitlint..."
    npm init -y
    npm install --save-dev husky
    npx husky init
    echo "npx --no -- commitlint --edit \$1" > .husky/commit-msg
    echo "" > .husky/pre-commit
    npm install --save-dev @commitlint/cli @commitlint/config-conventional
    echo "module.exports = {extends: ['@commitlint/config-conventional']}" > commitlint.config.js
    npm set-script prepare "husky install && chmod ug+x .husky/* && chmod ug+x commitlint.config.js"
    echo "node_modules\npackage-lock.json\npackage.json\ncommitlint.config.js\n.husky" | tee -a .gitignore
}

commitizen() {
    echo "Installing commitizen..."
    npm install --save-dev commitizen
    npx commitizen init cz-conventional-changelog --save-dev --save-exact
}

standard_version() {
    echo "Installing standard-version..."
    npm install --save-dev standard-version
    npm pkg set scripts.release="standard-version"
}

readme(){
    echo "Adding contributor instructions to readme.md"
    echo "
[![Commitizen friendly](https://img.shields.io/badge/commitizen-friendly-brightgreen.svg)](http://commitizen.github.io/cz-cli/)

## For Contributor

*Note:
This repo is commitizen friendly repo. Idea is to organize commits that is readable.
It uses husky for commitlint as a local git hook to ensure conventional commits messages are made.
It uses standard-version to group commits for releases. Changelog and release versions are updated.*

If you will be contributing to this repository then use script \`setup.sh\` to install:

- Husky for Commmitlint
- Commitizen tool to ensure commit are made in the right format
- Standard-version for releases.

*To use Commitizen tool installed from \`setup.sh\` script use \`npx cz\` inplace of \`git commit -m\`.*

*To use standard-version installed from \`setup.sh\` script use \`npm run release\`.*" | tee -a README.md
}

if [ $# -eq 0 ]; then
  commitlint
  commitizen
  standard_version
  readme
fi

while [[ $# -gt 0 ]]; do
    case "$1" in
        -h|--help)
            echo ""
            echo "Usage #1: ./commit_setup.sh (This run all functions in script.) OR\nUsage #2: ./commit_setup.sh [-cl|--commitlint] [-cz|--commitizen] [-sv|--standard-version] [-ct|--contributor]"
            echo "Options:"
            echo "  -cl, --commitlint           Install only commitlint"
            echo "  -cz, --commitizen           Install only commitizen"
            echo "  -sv, --standard-version     Install only release-please"
            echo "  -ct, --contributor          Add commitizen instructions for contributor"
        
            echo "\n  -h, --help              Display this help message\n"
            exit 0
            ;;
        -cl|--commitlint)
            commitlint
            shift
            ;;
        -cz|--commitizen)
            commitizen
            summary_flag=true
            shift
            ;;
        -sv|--standard-version)
            standard_version
            shift
            ;;
        -ct|--contributor)
            readme
            shift
            ;;
          *)
            echo "Invalid option: $1"
            exit 1
            ;;
    esac
done
