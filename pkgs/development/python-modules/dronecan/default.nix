{ lib
, buildPythonPackage
, fetchPypi
, pythonOlder
, pytestCheckHook
}:

buildPythonPackage rec {
  pname = "dronecan";
  version = "1.0.26";
  format = "setuptools";
  disabled = pythonOlder "3.3";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-D2odxa9ADswrg6rgKLTyQulHpGec1r0lWRUZDV5YvyE=";
  };

  nativeCheckInputs = [
    pytestCheckHook
  ];

  pythonImportsCheck = [
    "dronecan"
  ];

  meta = with lib; {
    description = "Python implementation of the DroneCAN v1 protocol stack";
    longDescription = ''
      DroneCAN is a lightweight protocol designed for reliable communication in aerospace and robotic applications via CAN bus.
    '';
    homepage = "https://dronecan.github.io/";
    license = licenses.mit;
    maintainers = teams.ororatech.members;
  };
}
