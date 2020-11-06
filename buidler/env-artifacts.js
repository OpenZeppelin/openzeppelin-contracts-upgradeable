const { BuidlerError } = require('@nomiclabs/buidler/internal/core/errors');

extendEnvironment(env => {
  const { artifacts } = env;

  env.artifacts = {
    ...artifacts,
    require (name) {
      try {
        return artifacts.require(name + 'UpgradeSafeWithInit');
      } catch (e) {
        if (BuidlerError.isBuidlerError(e) && e.number === 700) {
          return artifacts.require(name + 'UpgradeSafe');
        } else {
          throw e;
        }
      }
    },
  };
});
