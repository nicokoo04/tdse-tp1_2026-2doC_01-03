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
            "text": "interface:\r\n    in event EV_ACT_LED_ON\r\n    in event EV_ACT_LED_OFF\r\n    in event EV_ACT_BARRERA_SUBE\r\n    in event EV_ACT_BARRERA_BAJA\r\n    in event ev_tick\r\n    \r\n    operation SetDigitalOutput(state: boolean): void\r\n\r\ninternal:\r\n    var timer: integer = 0\r\n    var led_state: boolean = false //para ver cuando esta prendido\r\n    \r\n    /* Tiempos de parpadeo*/\r\n    var DEL_BLINK_1: integer = 1  /* (lento) */\r\n    var DEL_BLINK_2: integer = 2  /* rápido) */"
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
            "text": "ST_ACT_OFF",
            "fontSize": 11
          },
          "specification": {
            "text": "EV_ACT_LED_OFF / \nSetDigitalOutput(false);\nled_state = false"
          }
        },
        "id": "6cbbac6b-c914-4410-8bfb-e5f19917c3c7",
        "z": 9,
        "embeds": []
      },
      {
        "position": {
          "x": 94,
          "y": -113
        },
        "size": {
          "width": -1,
          "height": -1
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_ACT_BLINK_ON",
            "fontSize": 11
          },
          "specification": {
            "text": "ev_tick/\ntimer += 1;\nSetDigitalOutput(true);\nled_state = true\n"
          }
        },
        "id": "53456413-3081-4654-8513-3175f7c9ff5a",
        "z": 19,
        "embeds": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "53456413-3081-4654-8513-3175f7c9ff5a"
        },
        "target": {
          "id": "6cbbac6b-c914-4410-8bfb-e5f19917c3c7",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "94.91%",
              "dy": "64.516%",
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
                "text": "EV_ACT_LED_OFF / \nSetDigitalOutput(false)"
              }
            },
            "position": {
              "distance": 0.4406034705700629,
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
        "id": "fe1ad8ea-2813-41c9-844f-0305e680b656",
        "z": 32,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": -753,
          "y": -92
        },
        "size": {
          "width": -1,
          "height": -1
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_ACT_BLINK_ON_2",
            "fontSize": 11
          },
          "specification": {
            "text": "ev_tick/\ntimer += 1;\nSetDigitalOutput(true);\nled_state = true\n"
          }
        },
        "id": "1fef532b-9e6c-4be5-b833-b3fadda13710",
        "z": 43
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "6cbbac6b-c914-4410-8bfb-e5f19917c3c7",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "-0.683%",
              "dy": "37.097%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "1fef532b-9e6c-4be5-b833-b3fadda13710",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "99.006%",
              "dy": "35.577%",
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
                "text": "EV_ACT_BARRERA_BAJA"
              }
            },
            "position": {
              "distance": 0.516424361557329,
              "offset": 16,
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
        "id": "d5a43165-c7d6-470b-bc51-07600757b41d",
        "z": 44,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "1fef532b-9e6c-4be5-b833-b3fadda13710"
        },
        "target": {
          "id": "6cbbac6b-c914-4410-8bfb-e5f19917c3c7",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "3.414%",
              "dy": "80.645%",
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
                "text": "EV_ACT_LED_OFF / \nSetDigitalOutput(false)"
              }
            },
            "position": {
              "distance": 0.290588860090039,
              "offset": 17,
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
        "id": "e2f09155-72b0-4a67-be15-24b4f7f30cf4",
        "z": 44,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
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
            "text": "ST_ACT_ON",
            "fontSize": 11
          },
          "specification": {
            "text": "EV_ACT_LED_ON / \nSetDigitalOutput(true);\nled_state = true"
          }
        },
        "id": "fdf2a411-432f-4b2d-b173-20e28bd30aa8",
        "z": 45
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "6cbbac6b-c914-4410-8bfb-e5f19917c3c7"
        },
        "target": {
          "id": "fdf2a411-432f-4b2d-b173-20e28bd30aa8",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "11.351%",
              "dy": "14.516%",
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
        "id": "78d91a09-1f5c-4f77-af5b-6e96d5adea39",
        "z": 46,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "fdf2a411-432f-4b2d-b173-20e28bd30aa8"
        },
        "target": {
          "id": "6cbbac6b-c914-4410-8bfb-e5f19917c3c7",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "64.184%",
              "dy": "87.097%",
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
        "id": "8b19560b-9096-4bd7-9e63-93376788b016",
        "z": 46,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "6cbbac6b-c914-4410-8bfb-e5f19917c3c7",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "98.324%",
              "dy": "14.516%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "53456413-3081-4654-8513-3175f7c9ff5a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "2.731%",
              "dy": "42.308%",
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
                "text": "EV_ACT_BARRERA_SUBE"
              }
            },
            "position": {}
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
        "id": "06bee6a1-cb1c-4f66-b1d2-333dbced7f41",
        "z": 50,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": -1107,
          "y": -79
        },
        "size": {
          "width": 138,
          "height": 72
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_ACT_BLINK_OFF_2",
            "fontSize": 11
          },
          "specification": {
            "text": "ev_tick/\ntimer += 1"
          }
        },
        "id": "cc9665f3-41f4-4cbc-9a64-e6687019c94c",
        "z": 53
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "1fef532b-9e6c-4be5-b833-b3fadda13710"
        },
        "target": {
          "id": "cc9665f3-41f4-4cbc-9a64-e6687019c94c",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "97.826%",
              "dy": "36.111%",
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
                "text": "ev_tick[timer > DEL_BLINK_2] / \nSetDigitalOutput(true);\nled_state = true;\ntimer = 0"
              }
            },
            "position": {
              "distance": 0.47685185185185186,
              "offset": 12,
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
        "id": "eaf4ca19-ae54-4404-b648-a3d3f6a2f3d0",
        "z": 54,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "cc9665f3-41f4-4cbc-9a64-e6687019c94c"
        },
        "target": {
          "id": "1fef532b-9e6c-4be5-b833-b3fadda13710",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "3.414%",
              "dy": "61.538%",
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
                "text": "ev_tick[timer > DEL_BLINK_2] / \nSetDigitalOutput(false);\nled_state = false;\ntimer = 0"
              }
            },
            "position": {
              "distance": 0.48148148148148145,
              "offset": 36,
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
        "id": "f71d13b7-f2a9-4281-88f4-db0740111723",
        "z": 55,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "position": {
          "x": -240,
          "y": -295
        },
        "size": {
          "height": 18,
          "width": 18
        },
        "type": "Entry",
        "entryKind": "Initial",
        "attrs": {},
        "id": "0c49ba41-072e-42e5-b7f4-8aca4e06c71d",
        "z": 60,
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
          "y": -280
        },
        "attrs": {
          "label": {
            "refX": "50%",
            "textAnchor": "middle",
            "refY": "50%",
            "textVerticalAnchor": "middle"
          }
        },
        "id": "df6ddf45-b570-46e0-9b8d-cc681078fd50",
        "z": 61,
        "parent": "0c49ba41-072e-42e5-b7f4-8aca4e06c71d"
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "0c49ba41-072e-42e5-b7f4-8aca4e06c71d"
        },
        "target": {
          "id": "6cbbac6b-c914-4410-8bfb-e5f19917c3c7",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "49.461%",
              "dy": "8.065%",
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
        "id": "a61b9b92-c60d-45a9-9150-dadf719ae4b2",
        "z": 62,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "1fef532b-9e6c-4be5-b833-b3fadda13710"
        },
        "target": {
          "id": "fdf2a411-432f-4b2d-b173-20e28bd30aa8",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "0.709%",
              "dy": "43.548%",
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
                "text": "EV_ACT_LED_ON / \nSetDigitalOutput(true)"
              }
            },
            "position": {
              "distance": 0.28895305589974735,
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
        "id": "15da86ae-f656-4aef-b02a-29145e9af748",
        "z": 67,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -652,
            "y": 67
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "fdf2a411-432f-4b2d-b173-20e28bd30aa8",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "0%",
              "dy": "79.032%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "1fef532b-9e6c-4be5-b833-b3fadda13710",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "29.361%",
              "dy": "96.154%",
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
                "text": "EV_ACT_BARRERA_BAJA"
              }
            },
            "position": {
              "distance": 0.5124163965918187,
              "offset": -9,
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
        "id": "9d6a8372-319f-4c80-a0d0-7cf3238941b2",
        "z": 68,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "cc9665f3-41f4-4cbc-9a64-e6687019c94c"
        },
        "target": {
          "id": "fdf2a411-432f-4b2d-b173-20e28bd30aa8",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "6.385%",
              "dy": "43.548%",
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
                "text": "EV_ACT_LED_ON / \nSetDigitalOutput(true)"
              }
            },
            "position": {
              "distance": 0.2165475153544851,
              "offset": -14,
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
        "id": "fe0b67fb-2b80-4dc8-bd1d-2a061fc4f514",
        "z": 69,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -1030,
            "y": 66
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "fdf2a411-432f-4b2d-b173-20e28bd30aa8",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "97.902%",
              "dy": "66.129%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "53456413-3081-4654-8513-3175f7c9ff5a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "72.377%",
              "dy": "96.154%",
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
                "text": "EV_ACT_BARRERA_SUBE"
              }
            },
            "position": {
              "distance": 0.15768421416075254,
              "offset": -9,
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
        "id": "6eba6b4f-0e31-4ae4-8801-218bb95cb4f8",
        "z": 70,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "53456413-3081-4654-8513-3175f7c9ff5a"
        },
        "target": {
          "id": "fdf2a411-432f-4b2d-b173-20e28bd30aa8",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "97.902%",
              "dy": "32.258%",
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
                "text": "EV_ACT_LED_ON / \nSetDigitalOutput(true)"
              }
            },
            "position": {
              "distance": 0.38649631701861176,
              "offset": 10,
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
        "id": "bbe035c6-4ea0-4f63-a566-d25c9e4b0e42",
        "z": 71,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 145,
            "y": 49
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "cc9665f3-41f4-4cbc-9a64-e6687019c94c",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "21.739%",
              "dy": "0%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "6cbbac6b-c914-4410-8bfb-e5f19917c3c7",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "49.162%",
              "dy": "0%",
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
                "text": "EV_ACT_LED_OFF / \nSetDigitalOutput(false)"
              }
            },
            "position": {
              "distance": 0.14739963485162838,
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
        "id": "010910cd-436d-4395-9716-930559769470",
        "z": 73,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -567,
            "y": -212
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "cc9665f3-41f4-4cbc-9a64-e6687019c94c"
        },
        "target": {
          "id": "53456413-3081-4654-8513-3175f7c9ff5a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "22.533%",
              "dy": "0.962%",
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
                "text": "EV_ACT_BARRERA_SUBE"
              }
            },
            "position": {
              "distance": 0.09448343662965512,
              "offset": 9,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "4"
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
        "id": "0445f5d6-5097-4cac-9fe7-e40d4fc64848",
        "z": 74,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 77,
            "y": -135
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "1fef532b-9e6c-4be5-b833-b3fadda13710",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "80.571%",
              "dy": "0.962%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "53456413-3081-4654-8513-3175f7c9ff5a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "21.85%",
              "dy": "3.846%",
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
                "text": "EV_ACT_BARRERA_SUBE"
              }
            },
            "position": {
              "distance": 0.2735311660056127,
              "offset": 12,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "4"
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
        "id": "a600cf9c-9f1f-4890-9c29-c4c2fbd5d4f2",
        "z": 75,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -512,
            "y": -134
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "53456413-3081-4654-8513-3175f7c9ff5a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "72.377%",
              "dy": "0%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "1fef532b-9e6c-4be5-b833-b3fadda13710",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "18.436%",
              "dy": "3.846%",
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
                "text": "EV_ACT_BARRERA_BAJA"
              }
            },
            "position": {
              "distance": 0.3194844022056422,
              "offset": 8,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "4"
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
        "id": "7eae53b9-85df-48fb-9f07-eb22e6d2c3fb",
        "z": 76,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -164,
            "y": -164
          }
        ]
      },
      {
        "position": {
          "x": 535,
          "y": -87
        },
        "size": {
          "width": -1,
          "height": -1
        },
        "type": "State",
        "attrs": {
          "name": {
            "text": "ST_ACT_BLINK_OFF",
            "fontSize": 11
          },
          "specification": {
            "text": "ev_tick/\ntimer += 1"
          }
        },
        "id": "8146e28e-bcc1-4b51-b60d-15e333620826",
        "z": 78
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "53456413-3081-4654-8513-3175f7c9ff5a"
        },
        "target": {
          "id": "8146e28e-bcc1-4b51-b60d-15e333620826",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "0.881%",
              "dy": "75.862%",
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
                "text": "ev_tick[timer > DEL_BLINK_1] / \nSetDigitalOutput(false);\nled_state = false;\ntimer = 0"
              }
            },
            "position": {
              "distance": 0.4882128263774671,
              "offset": 43.115325927734375,
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
        "id": "754d1a2a-fd78-4b62-844a-c42d03be596b",
        "z": 79,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "8146e28e-bcc1-4b51-b60d-15e333620826"
        },
        "target": {
          "id": "53456413-3081-4654-8513-3175f7c9ff5a",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "100.372%",
              "dy": "41.346%",
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
                "text": "ev_tick[timer > DEL_BLINK_1] / \nSetDigitalOutput(true);\nled_state = true;\ntimer = 0"
              }
            },
            "position": {
              "distance": 0.48835159977384746,
              "offset": 12.999999694824226,
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
        "id": "55c7d0b2-dd85-4137-8e52-9de9bc000317",
        "z": 79,
        "router": {
          "name": "orthogonal"
        },
        "vertices": []
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "8146e28e-bcc1-4b51-b60d-15e333620826",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "49.128%",
              "dy": "90.323%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "fdf2a411-432f-4b2d-b173-20e28bd30aa8",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "98.612%",
              "dy": "32.258%",
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
                "text": "EV_ACT_LED_ON / \nSetDigitalOutput(true)"
              }
            },
            "position": {
              "distance": 0.3950427784184601,
              "offset": -21,
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
        "id": "e192c198-fcad-4209-a58f-5e3ad23a23c2",
        "z": 80,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 541,
            "y": 69
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "8146e28e-bcc1-4b51-b60d-15e333620826",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "74.675%",
              "dy": "12.903%",
              "rotate": true
            }
          },
          "priority": true
        },
        "target": {
          "id": "6cbbac6b-c914-4410-8bfb-e5f19917c3c7",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "49.162%",
              "dy": "6.452%",
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
                "text": "EV_ACT_LED_OFF / \nSetDigitalOutput(false)"
              }
            },
            "position": {
              "distance": 0.1464205653411119,
              "offset": 18,
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
        "id": "442ef2b4-7bd5-4992-b0e0-c3ab09c61714",
        "z": 81,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": 203,
            "y": -210
          }
        ]
      },
      {
        "type": "Transition",
        "attrs": {},
        "source": {
          "id": "8146e28e-bcc1-4b51-b60d-15e333620826"
        },
        "target": {
          "id": "1fef532b-9e6c-4be5-b833-b3fadda13710",
          "anchor": {
            "name": "topLeft",
            "args": {
              "dx": "19.801%",
              "dy": "1.923%",
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
                "text": "EV_ACT_BARRERA_BAJA"
              }
            },
            "position": {
              "distance": 0.12588365810301438,
              "offset": 6.000000000000028,
              "angle": 0
            }
          },
          {
            "attrs": {
              "label": {
                "text": "4"
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
        "id": "6fa93571-7f2a-4436-b1fa-e0e5eed20b26",
        "z": 82,
        "router": {
          "name": "orthogonal"
        },
        "vertices": [
          {
            "x": -724,
            "y": -164
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