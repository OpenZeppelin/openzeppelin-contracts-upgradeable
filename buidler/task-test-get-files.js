const { internalTask } = require('@nomiclabs/buidler/config');

const { TASK_TEST_GET_TEST_FILES } = require('@nomiclabs/buidler/builtin-tasks/task-names');
const glob = require('glob');
const path = require('path');
const { promisify } = require('util');

internalTask(TASK_TEST_GET_TEST_FILES)
  .setAction(async ({ testFiles }, { config }) => {
    if (testFiles.length !== 0) {
      return testFiles;
    }
    return await promisify(glob)(
      path.join(config.paths.tests, '**/*.js'),
      { ignore: [path.join(config.paths.tests, 'proxy/**/*')] },
    );
  });
