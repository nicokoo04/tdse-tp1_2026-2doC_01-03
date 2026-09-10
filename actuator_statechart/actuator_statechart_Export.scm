{
  "graph": {
    "cells": [
      {
        "position": {
          "x": 0,
          "y": 0
        },
        "size": {
          "height": 10,
          "width": 10
        },
        "type": "Statechart",
        "id": "00ffb6d1-d225-4bc0-8b73-7df9987f57b7",
        "attrs": {
          "name": {
            "text": "actuator_statechart Export"
          },
          "specification": {
            "text": "interface:\r\n    in event EV_ACT_LED_ON\r\n    in event EV_ACT_LED_OFF\r\n    \r\n    operation SetDigitalOutput(state: boolean): void\r\n\r\ninternal:\r\n    var led_state: boolean = false //para ver cuando esta prendido"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": -305,
          "y": -78
        },
        "size": {
          "width": -1,
          "height": -1
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_ACT_BARRERA_BAJA",
            "fontSize": 11
          },
          "specification": {
            "text": "EV_ACT_LED_OFF / \nSetDigitalOutput(false);\nled_state = false"
          }
        },
        "z": 9,
        "id": "6cbbac6b-c914-4410-8bfb-e5f19917c3c7",
        "embeds": []
      },
      {
        "position": {
          "x": -291,
          "y": 49
        },
        "size": {
          "width": -1,
          "height": -1
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_ACT_BARRERA_ARRIBA",
            "fontSize": 11
          },
          "specification": {
            "text": "EV_ACT_LED_ON / \nSetDigitalOutput(true);\nled_state = true"
          }
        },
        "z": 45,
        "id": "fdf2a411-432f-4b2d-b173-20e28bd30aa8"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "6cbbac6b-c914-4410-8bfb-e5f19917c3c7"
        },
        "target": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": "11.351%",
              "dy": "14.516%"
            },
            "name": "topLeft"
          },
          "id": "fdf2a411-432f-4b2d-b173-20e28bd30aa8",
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_ACT_LED_ON / \nSetDigitalOutput(true);\nled_state = true"
              }
            },
            "position": {
              "distance": 0.5277777777777778,
              "offset": 66,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "z": 46,
        "id": "78d91a09-1f5c-4f77-af5b-6e96d5adea39"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "fdf2a411-432f-4b2d-b173-20e28bd30aa8"
        },
        "target": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": "64.184%",
              "dy": "87.097%"
            },
            "name": "topLeft"
          },
          "id": "6cbbac6b-c914-4410-8bfb-e5f19917c3c7",
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_ACT_LED_OFF / \nSetDigitalOutput(false);\nled_state = false"
              }
            },
            "position": {
              "distance": 0.4444444444444444,
              "offset": 70,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "z": 46,
        "id": "8b19560b-9096-4bd7-9e63-93376788b016"
      },
      {
        "position": {
          "x": -240,
          "y": -146
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "z": 63,
        "id": "0c49ba41-072e-42e5-b7f4-8aca4e06c71d",
        "embeds": [
          "df6ddf45-b570-46e0-9b8d-cc681078fd50"
        ]
      },
      {
        "type": "NodeLabel",
        "label": true,
        "size": {
          "width": 15,
          "height": 15
        },
        "position": {
          "x": -240,
          "y": -131
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "refY": "50%",
            "textVerticalAnchor": "middle",
            "textAnchor": "middle"
          }
        },
        "parent": "0c49ba41-072e-42e5-b7f4-8aca4e06c71d",
        "z": 64,
        "id": "df6ddf45-b570-46e0-9b8d-cc681078fd50"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "0c49ba41-072e-42e5-b7f4-8aca4e06c71d"
        },
        "target": {
          "anchor": {
            "args": {
              "rotate": true,
              "dx": "49.461%",
              "dy": "8.065%"
            },
            "name": "topLeft"
          },
          "id": "6cbbac6b-c914-4410-8bfb-e5f19917c3c7",
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {},
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "1"
              }
            }
          },
          {
            "attrs": {}
          },
          {
            "attrs": {}
          }
        ],
        "router": {
          "name": "orthogonal"
        },
        "vertices": [],
        "z": 65,
        "id": "a61b9b92-c60d-45a9-9150-dadf719ae4b2"
      }
    ]
  },
  "genModel": {
    "generator": {
      "type": "create::c",
      "features": {
        "Outlet": {
          "targetProject": "",
          "targetFolder": "",
          "libraryTargetFolder": "",
          "skipLibraryFiles": "",
          "apiTargetFolder": ""
        },
        "LicenseHeader": {
          "licenseText": ""
        },
        "FunctionInlining": {
          "inlineReactions": false,
          "inlineEntryActions": false,
          "inlineExitActions": false,
          "inlineEnterSequences": false,
          "inlineExitSequences": false,
          "inlineChoices": false,
          "inlineEnterRegion": false,
          "inlineExitRegion": false,
          "inlineEntries": false
        },
        "OutEventAPI": {
          "observables": false,
          "getters": false
        },
        "IdentifierSettings": {
          "moduleName": "ActuatorStatechart",
          "statemachinePrefix": "actuatorStatechart",
          "separator": "_",
          "headerFilenameExtension": "h",
          "sourceFilenameExtension": "c"
        },
        "Tracing": {
          "enterState": false,
          "exitState": false,
          "generic": false
        },
        "Includes": {
          "useRelativePaths": false,
          "generateAllSpecifiedIncludes": false
        },
        "GeneratorOptions": {
          "userAllocatedQueue": false,
          "metaSource": false
        },
        "GeneralFeatures": {
          "timerService": false,
          "timerServiceTimeType": ""
        },
        "Debug": {
          "dumpSexec": false
        }
      }
    }
  }
}