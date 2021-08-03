function gh-pr-draft() {
  GITHUB_TOKEN=$(ruby -ryaml -e 'puts YAML.load_file("#{ENV["HOME"]}/.config/gh/hosts.yml")["github.com"]["oauth_token"]')
  repo=$(gh repo view | grep name | awk '{print $NF}')
  owner=$(echo $repo | awk -F'/' '{print $1}')
  name=$(echo $repo | awk -F'/' '{print $NF}')
  number=$1
  if [[ -z $number ]]; then
    number=$(gh pr view | grep number | awk '{print $NF}')
  fi
  cat <<QUERY>/tmp/query.txt
query {
  repository(owner:"$owner", name:"$name") {
    pullRequest(number:$number) {
      id
      number
      isDraft
    }
  }
}
QUERY
  if [[ -n $DEBUG ]]; then
    cat /tmp/query.txt
  fi
  # gq == graphqurl
  gq https://api.github.com/graphql -H "Authorization: token $GITHUB_TOKEN" --queryFile=/tmp/query.txt > /tmp/query.json
  id=$(jq '.data.repository.pullRequest.id' /tmp/query.json)
  cat <<MUTATION>/tmp/mutation.txt
mutation {
  convertPullRequestToDraft(input:{pullRequestId:$id}) {
    pullRequest {
      id
      number
      isDraft
    }
  }
}
MUTATION
  if [[ -n $DEBUG ]]; then
    cat /tmp/mutation.txt
  fi
  gq https://api.github.com/graphql -H "Authorization: token $GITHUB_TOKEN" --queryFile=/tmp/mutation.txt
}

gh-pr-draft
