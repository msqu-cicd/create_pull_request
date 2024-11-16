const core = require('@actions/core');
const github = require('@actions/github');


try {
  // Fetch the value of the input 'who-to-greet' specified in action.yml
  const baseBranch = core.getInput('base');
  console.log(`Hello ${baseBranch}!`);

} catch (error) {
  // Handle errors and indicate failure
  core.setFailed(error.message);
}
