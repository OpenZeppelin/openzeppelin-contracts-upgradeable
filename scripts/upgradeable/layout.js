const fs = require('fs');
const path = require('path');
const { findAll } = require('solidity-ast/utils');
const { astDereferencer } = require('@openzeppelin/upgrades-core/dist/ast-dereferencer');
const { solcInputOutputDecoder } = require('@openzeppelin/upgrades-core/dist/src-decoder');
const { extractStorageLayout } = require('@openzeppelin/upgrades-core/dist/storage/extract');
const { StorageLayoutComparator } = require('@openzeppelin/upgrades-core/dist/storage/compare');
const { LayoutCompatibilityReport } = require('@openzeppelin/upgrades-core/dist/storage/report');


const { build, check, _: artifacts } = require('yargs').argv;


// build layout for current version of the code
const layout = {}
for (const artifact of artifacts) {
    const { input, output } = require(path.resolve(__dirname, '../..', artifact));

    const decoder = solcInputOutputDecoder(input, output);
    const deref = astDereferencer(output);

    for (const src in output.contracts) {
        for (const contractDef of findAll('ContractDefinition', output.sources[src].ast)) {
            layout[contractDef.name] = extractStorageLayout(
                contractDef,
                decoder,
                deref,
                output.contracts[src][contractDef.name].storageLayout
            ).storage;
        }
    }
}

// if the --check option is set, check compatibility of the current layout against the cache
if (check) {
    const cache = JSON.parse(fs.readFileSync(path.resolve(__dirname, '../..', check)));

    for (id in cache) {
        const comparator = new StorageLayoutComparator();
        const report = new LayoutCompatibilityReport(comparator.layoutLevenshtein(cache[id], layout[id], { allowAppend: false }));

        if (!report.ok) {
            console.log(`Storage incompatibility in ${id}`);
            console.log(report.explain());
            process.exitCode = 1;
        }
    }
}

// if the --build option is set, write the layout results
if (build) {
    fs.writeFileSync(path.resolve(__dirname, '../..', build), JSON.stringify(layout));
}
