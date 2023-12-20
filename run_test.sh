#! /usr/bin/bash
mkdir reports 2> /dev/null
set -euo pipefail

HERE=$(cygpath -w $(pwd))

g-cli vipc -- -v "20.0 (64-bit)" -t 1200 "Approval Testing.vipc"
# begin-snippet: run_tests
echo "Running Caraya Tests" # needed because caray tool is not very verbose.
g-cli caraya -- -s "Tests\\Caraya.Tests\\Caraya Extension Tests\\Caraya Extension Tests.lvclass" -x "reports\\Caraya.UnitTestReport.xml"
g-cli vitester -- -r "reports\\VItester.UnitTestReport.xml" "Approval Testing.lvproj"
g-cli lunit -- -r "reports\\LUnit.UnitTestReport.xml" "Approval Testing.lvproj"
# end-snippet
