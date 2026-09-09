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
            "text": "system_statechart Export"
          },
          "specification": {
            "text": "@EventDriven\r\n@SuperSteps(no)\r\n\r\ninterface:\r\n    // Eventos de Entrada (Sensores)\r\n    in event EV_SYS_AUTO_LLEGA\r\n    in event EV_SYS_AUTO_SALE\r\n    in event EV_SYS_BOTON_PULSADO\r\n    \r\n    // Reloj para el sistema temporizado\r\n    in event ev_tick\r\n    \r\n    // Eventos de Salida (Actuadores)\r\n    out event EV_ACT_BIENVENIDA\r\n    out event EV_ACT_IMPRIMIR\r\n    out event EV_ACT_ABRIR_BARRERA\r\n    out event EV_ACT_CERRAR_BARRERA\r\n    out event EV_ACT_NOTIFICAR_SERVER\r\n\r\n    // Variables de temporización\r\n    var tick: integer = 0\r\n    var DEL_SYS_TIMEOUT: integer =3 \r\n    var DEL_SYS_HOLD: integer = 5 "
          }
        },
        "z": 1
      },
      {
        "position": {
          "x": -244,
          "y": -185
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "e60f0995-ef91-4a83-977c-0e767308c0b1",
        "z": 2,
        "embeds": [
          "d424730f-0940-43b1-b3d9-4128c1843a08"
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
          "x": -244,
          "y": -170
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "d424730f-0940-43b1-b3d9-4128c1843a08",
        "z": 3,
        "parent": "e60f0995-ef91-4a83-977c-0e767308c0b1"
      },
      {
        "position": {
          "x": -299,
          "y": -119
        },
        "size": {
          "width": 135,
          "height": 60
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_SYS_ESPERANDO_AUTO",
            "fontSize": 11
          }
        },
        "id": "f9686985-ad7a-49c6-905a-eee3406e9617",
        "z": 7
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "e60f0995-ef91-4a83-977c-0e767308c0b1"
        },
        "target": {
          "id": "f9686985-ad7a-49c6-905a-eee3406e9617",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "47.599%",
              "dy": "6.667%",
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
        "id": "13a44507-d2b7-44ee-b1de-ee085cc2e8ba",
        "z": 10,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": -311,
          "y": 144
        },
        "size": {
          "width": -1,
          "height": -1
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_SYS_INGRESO_HABILITADO",
            "fontSize": 11
          },
          "specification": {
            "text": "ev_tick / tick += 1"
          }
        },
        "id": "54985eb9-6aa7-4c75-8a2d-06ff217c26f8",
        "z": 15
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "54985eb9-6aa7-4c75-8a2d-06ff217c26f8"
        },
        "target": {
          "id": "f9686985-ad7a-49c6-905a-eee3406e9617",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "98.975%",
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
                "text": "EV_SYS_AUTO_SALE / \nraise EV_ACT_CERRAR_BARRERA; \nraise EV_ACT_NOTIFICAR_SERVER"
              }
            },
            "position": {
              "distance": 0.4906120372385149,
              "offset": 96,
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
        "id": "c41b1424-3112-48f7-b338-3ab0dd588d36",
        "z": 16,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 223,
            "y": 178
          },
          {
            "x": 284,
            "y": 30
          },
          {
            "x": 284,
            "y": -86
          }
        ]
      },
      {
        "position": {
          "x": -324,
          "y": -6
        },
        "size": {
          "width": -1,
          "height": -1
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_SYS_AUTO_DETECTADO",
            "fontSize": 11
          },
          "specification": {
            "text": "ev_tick / tick += 1"
          }
        },
        "id": "ddba7e01-00c2-4923-b890-4c06de46e37a",
        "z": 19
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "f9686985-ad7a-49c6-905a-eee3406e9617"
        },
        "target": {
          "id": "ddba7e01-00c2-4923-b890-4c06de46e37a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "49.865%",
              "dy": "8.333%",
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
                "text": "EV_SYS_AUTO_LLEGA / \nraise EV_ACT_BIENVENIDA; \ntick = 0"
              }
            },
            "position": {
              "distance": 0.6636363636363637,
              "offset": -73,
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
        "id": "d40df732-06fd-43f4-8b94-305c379f6880",
        "z": 20,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "ddba7e01-00c2-4923-b890-4c06de46e37a"
        },
        "target": {
          "id": "f9686985-ad7a-49c6-905a-eee3406e9617",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "1.511%",
              "dy": "63.333%",
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
                "text": "EV_SYS_AUTO_SALE"
              }
            },
            "position": {
              "distance": 0.4828730757258936,
              "offset": -51,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "3"
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
        "id": "46d11b1c-28cc-47b2-9816-eee4c83d726e",
        "z": 20,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -345,
            "y": 17
          },
          {
            "x": -345,
            "y": -22
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "ddba7e01-00c2-4923-b890-4c06de46e37a"
        },
        "target": {
          "id": "54985eb9-6aa7-4c75-8a2d-06ff217c26f8",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "51.102%",
              "dy": "6.667%",
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
                "text": "EV_SYS_BOTON_PULSADO / \nraise EV_ACT_IMPRIMIR; \nraise EV_ACT_ABRIR_BARRERA; \ntick = 0"
              }
            },
            "position": {
              "distance": 0.5795454545454546,
              "offset": -82,
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
        "id": "117186de-95a0-4055-87d5-a9cdea4cf806",
        "z": 20,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "ddba7e01-00c2-4923-b890-4c06de46e37a"
        },
        "target": {
          "id": "f9686985-ad7a-49c6-905a-eee3406e9617",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "92.175%",
              "dy": "71.667%",
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
                "text": "ev_tick [tick >= DEL_SYS_TIMEOUT]"
              }
            },
            "position": {
              "distance": 0.4856186423282765,
              "offset": 107,
              "angle": 0
            }
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
        "id": "31ebf69e-0f91-4539-9d5e-359c3b52dc90",
        "z": 20,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -79,
            "y": 17
          },
          {
            "x": -79,
            "y": -76
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "54985eb9-6aa7-4c75-8a2d-06ff217c26f8"
        },
        "target": {
          "id": "ddba7e01-00c2-4923-b890-4c06de46e37a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "31.732%",
              "dy": "95%",
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
                "text": "ev_tick [tick >= DEL_SYS_HOLD] / \nraise EV_ACT_CERRAR_BARRERA"
              }
            },
            "position": {
              "distance": 0.4222222222222222,
              "offset": -91,
              "angle": 0
            }
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
        "id": "b570b843-1aec-4e55-adfa-d186d62e04d9",
        "z": 21,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
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
          "moduleName": "SystemStatechart",
          "statemachinePrefix": "systemStatechart",
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