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
            "text": "sensor_statechart Export"
          },
          "specification": {
            "text": "interface:\r\nin event EV_BTN_BAJO\r\nin event EV_BTN_ALTO\r\nin event ev_tick\r\nout event EV_SYS_BTN_PRESSED\r\nout event EV_SYS_BTN_RELEASED\r\nvar timer: integer = 0\r\nconst DEL_BTN: integer = 5"
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": -324,
          "y": -144
        },
        "size": {
          "width": 121,
          "height": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_BTN_UP",
            "fontSize": 11
          }
        },
        "id": "c92b495a-2c31-4c75-ae49-e79ee807e7bb",
        "z": 2
      },
      {
        "position": {
          "x": -325,
          "y": -6
        },
        "size": {
          "width": 99,
          "height": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_BTN_RISING",
            "fontSize": 11
          },
          "specification": {
            "text": "ev_tick/    timer += 1"
          }
        },
        "id": "0e972c6e-d712-427c-8471-52bc1b85cd50",
        "z": 6
      },
      {
        "position": {
          "x": -46,
          "y": -146
        },
        "size": {
          "width": 94,
          "height": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_BTN_FALLING",
            "fontSize": 11
          },
          "specification": {
            "text": "ev_tick/   timer += 1"
          }
        },
        "id": "6ab706c9-2caf-47ce-832b-ce8e5101d1a2",
        "z": 7
      },
      {
        "position": {
          "x": -43,
          "y": -6
        },
        "size": {
          "width": 94,
          "height": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_BTN_DOWN",
            "fontSize": 11
          }
        },
        "id": "e7e83a50-b9be-46bd-8208-c0a4e29a0dcc",
        "z": 8
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "c92b495a-2c31-4c75-ae49-e79ee807e7bb"
        },
        "target": {
          "id": "6ab706c9-2caf-47ce-832b-ce8e5101d1a2",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "18.085%",
              "dy": "53.333%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_BTN_BAJO/timer = 0"
              }
            },
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
        "id": "196dddc9-9e2f-42a8-90b2-50291d371d1b",
        "z": 11,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "6ab706c9-2caf-47ce-832b-ce8e5101d1a2"
        },
        "target": {
          "id": "e7e83a50-b9be-46bd-8208-c0a4e29a0dcc",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "47.872%",
              "dy": "88.333%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "ev_tick[timer >= DEL_BTN] / raise EV_SYS_BTN_PRESSED"
              }
            },
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
        "id": "aa7bebd0-0977-4231-9da0-4eaf5c95dbc5",
        "z": 12,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "e7e83a50-b9be-46bd-8208-c0a4e29a0dcc"
        },
        "target": {
          "id": "0e972c6e-d712-427c-8471-52bc1b85cd50",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "54.545%",
              "dy": "53.333%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_BTN_ALTO/timer = 0"
              }
            },
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
        "id": "f998d484-cf76-493c-8c22-12e99f16e888",
        "z": 13,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "0e972c6e-d712-427c-8471-52bc1b85cd50"
        },
        "target": {
          "id": "c92b495a-2c31-4c75-ae49-e79ee807e7bb",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "35.537%",
              "dy": "36.667%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "ev_tick[timer >= DEL_BTN] / raise EV_SYS_BTN_RELEASED"
              }
            },
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
        "id": "8d603984-75d7-4884-8154-9308a81e7d71",
        "z": 14,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": -290,
          "y": -208
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "81cba782-c39e-4175-8b30-48c33f03bf54",
        "z": 15,
        "embeds": [
          "77ed5b79-0cfe-4b44-86b5-fbb15e6071d9"
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
          "x": -290,
          "y": -193
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "77ed5b79-0cfe-4b44-86b5-fbb15e6071d9",
        "z": 16,
        "parent": "81cba782-c39e-4175-8b30-48c33f03bf54"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "81cba782-c39e-4175-8b30-48c33f03bf54"
        },
        "target": {
          "id": "c92b495a-2c31-4c75-ae49-e79ee807e7bb",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "36.364%",
              "dy": "38.333%",
              "rotate": true
            }
          },
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
        "id": "f12786ef-930e-4f32-b29f-10ef9897dc18",
        "z": 17,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "0e972c6e-d712-427c-8471-52bc1b85cd50"
        },
        "target": {
          "id": "e7e83a50-b9be-46bd-8208-c0a4e29a0dcc",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "53.191%",
              "dy": "85%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_BTN_BAJO"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "2"
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
        "id": "9cd8ef59-f271-4ab1-a032-689b0a5998bd",
        "z": 18,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -104,
            "y": 106
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "6ab706c9-2caf-47ce-832b-ce8e5101d1a2"
        },
        "target": {
          "id": "c92b495a-2c31-4c75-ae49-e79ee807e7bb",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "76.033%",
              "dy": "21.667%",
              "rotate": true
            }
          },
          "priority": true
        },
        "connector": {
          "name": "rounded"
        },
        "labels": [
          {
            "attrs": {
              "text": {
                "text": "EV_BTN_ALTO"
              }
            },
            "position": {}
          },
          {
            "attrs": {
              "label": {
                "text": "2"
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
        "id": "61476dd4-085c-4f7c-8ccc-96f09535a894",
        "z": 19,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -150,
            "y": -196
          }
        ]
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
          "moduleName": "SensorStatechart",
          "statemachinePrefix": "sensorStatechart",
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