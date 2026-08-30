const fs = require("fs");
const path = require("path");

async function main() {
    const [sourceAsar, patchDir, outputAsar, workDir, runtimeAsar] = process.argv.slice(2);
    if (![sourceAsar, patchDir, outputAsar, workDir, runtimeAsar].every(Boolean)) {
        throw new Error("Missing patch-builder argument.");
    }

    const asar = require(path.join(runtimeAsar, "node_modules", "asar"));
    fs.mkdirSync(workDir, { recursive: true });
    await asar.extractAll(sourceAsar, workDir);
    fs.cpSync(patchDir, workDir, { recursive: true, force: true });
    await asar.createPackage(workDir, outputAsar);
}

main().catch((error) => {
    console.error(error && error.stack ? error.stack : error);
    process.exitCode = 1;
});
