const { BuidlerError } = require('@nomiclabs/buidler/internal/core/errors');

extendEnvironment(env => {
  const { artifacts } = env;

  env.artifacts = {
    ...artifacts,
    require (name) {
      for (const suffix of ['UpgradeableWithInit', 'Upgradeable', '']) {
        try {
          return artifacts.require(name + suffix);
        } catch (e) {
          if (BuidlerError.isBuidlerError(e) && e.number === 700 && suffix !== '') {
            continue;
          } else {
            throw e;
          }
        }
      }
      throw new Error('Unreachable');
    },
  };
});
