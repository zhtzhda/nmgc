function cli(...args) {
  const { exec } = require("child_process");
  const path = require("path");

  const script = exec(
    `sh ${path.join(__dirname, "scripts", "nodeModuleHandler.sh")} ${args.join(
      " "
    )}`
  );

  script.stdout.on("data", (message) => console.log(message));
}

module.exports = {
  cli
};
