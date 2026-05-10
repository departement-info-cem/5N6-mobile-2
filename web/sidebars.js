// @ts-check
let jodates = [
  "2026-08-22",
  "2026-08-26",
  "2026-09-02",
  "2026-09-09",
  "2026-09-16",
  "2026-09-19",
  "2026-09-23",
  "2026-09-24",
  "2026-09-26",
  "2026-10-03",
  "2026-10-21",
  "2026-10-21",
  "2026-10-07",
  "2026-10-10",
  "2026-10-28",
  "2026-10-01",
  "2026-10-31",
  "2026-11-04",
  "2026-11-07",
  "2026-11-11",
  "2026-11-14",
  "2026-11-18",
  "2026-11-21",
  "2026-11-25",
  "2026-12-02",
  "2026-12-05",
  "2026-12-09",
  "2026-12-19",
  "2026-12-12",
  "2026-12-16",
];

let podates = [
  "2026-08-25",
  "2026-08-28",
  "2026-08-29",
  "2026-09-04",
  "2026-09-08",
  "2026-09-11",
  "2026-09-15",
  "2026-09-18",
  "2026-09-22",
  "2026-09-25",
  "2026-09-29",
  "2026-10-02",
  "2026-10-06",
  "2026-10-09",
  "2026-10-20",
  "2026-10-23",
  "2026-10-27",
  "2026-10-30",
  "2026-11-03",
  "2026-11-10",
  "2026-11-13",
  "2026-11-17",
  "2026-11-20",
  "2026-11-27",
  "2026-12-01",
  "2026-12-04",
  "2026-12-08",
  "2026-12-11",
  "2026-12-15",
];

/** @type {import('@docusaurus/plugin-content-docs').SidebarsConfig} */
const sidebars = {
  docs: [
    {
      type: "doc",
      label: "1.1 - Intro ",
      id: "cours/intro",
      customProps: {
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[0] }],
          "Joris": [{ 1010: jodates[0] }, { 1020: jodates[0] }],
        },
      },
    },
    {
      type: "doc",
      label: "1.2 - Mise en page ",
      id: "cours/mise-en-page",
      customProps: {
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[1] }],
          "Joris": [{ 1010: jodates[1] }, { 1020: jodates[1] }],
        },
      },
    },
    {
      type: "doc",
      label: "2.1 - Navigation ",
      id: "cours/navigation",
      className: "remise-tp1",
      customProps: {
        avancementLabel: "TP1",
        avancement: 1.0,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[2] }],
          "Joris": [{ 1010: jodates[2] }, { 1020: jodates[2] }],
        },
      },
    },
    {
      type: "doc",
      label: "2.2 - Liste ",
      id: "cours/liste",
      customProps: {
        avancementLabel: "TP2 - Cr\u00e9\u00e9",
        avancement: 0.0,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[3] }],
          "Joris": [{ 1010: jodates[3] }, { 1020: jodates[3] }],
        },
      },
    },
    {
      type: "doc",
      label: "3.1 - Multilingue ",
      id: "cours/multilingue",
      customProps: {
        avancementLabel: "TP2",
        avancement: 0.33,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[4] }],
          "Joris": [{ 1010: jodates[4] }, { 1020: jodates[4] }],
        },
      },
    },
    {
      type: "doc",
      label: "3.2 - Image Picker ",
      id: "cours/image-picker",
      customProps: {
        avancementLabel: "TP2",
        avancement: 0.67,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[5] }],
          "Joris": [{ 1010: jodates[5] }, { 1020: jodates[5] }],
        },
      },
    },
    {
      type: "doc",
      label: "4.1 - Intégration ",
      id: "cours/integration",
      customProps: {
        avancementLabel: "TP2",
        avancement: 0.9,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[6] }],
          "Joris": [{ 1010: jodates[6] }, { 1020: jodates[6] }],
        },
      },
    },
    {
      type: "doc",
      label: "4.2 - Remise TP2",
      id: "cours/integration",
      className: "remise-tp2",
      customProps: {
        avancementLabel: "TP2",
        avancement: 1.0,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[7] }],
          "Joris": [{ 1010: jodates[7] }, { 1020: jodates[7] }],
        },
      },
    },
    {
      type: "doc",
      label: "5.1 - DIO",
      id: "cours/dio",
      customProps: {
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[8] }],
          "Joris": [{ 1010: jodates[8] }, { 1020: jodates[8] }],
        },
      },
    },
    {
      type: "doc",
      label: "5.2 - Examen papier Flutter + Organisation du code ",
      id: "cours/organisation",
      className: "examen",
      customProps: {
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[9] }],
          "Joris": [{ 1010: jodates[9] }, { 1020: jodates[9] }],
        },
      },
    },
    {
      type: "doc",
      label: "6.1 - Authentification Firebase ",
      id: "cours/firebase-authentification",
      customProps: {
        avancementLabel: "TP3 - Créé",
        avancement: 0.0,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[10] }],
          "Joris": [{ 1010: jodates[10] }, { 1020: jodates[10] }],
        },
      },
    },
    {
      type: "doc",
      label: "6.2 - Firebase Firestore ",
      id: "cours/firebase-datastore",
      customProps: {
        avancementLabel: "TP3",
        avancement: 0.25,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[11] }],
          "Joris": [{ 1010: jodates[11] }, { 1020: jodates[11] }],
        },
      },
    },
    {
      type: "doc",
      label: "7.1 - Formatif ",
      id: "cours/formatif-intra",
      customProps: {
        avancementLabel: "TP3",
        avancement: 0.4,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[12] }],
          "Joris": [{ 1010: jodates[12] }, { 1020: jodates[12] }],
        },
      },
    },
    {
      type: "doc",
      label: "7.2 - Examen Intra (20%) ",
      id: "cours/examen",
      className: "examen",
      customProps: {
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[13] }],
          "Joris": [{ 1010: jodates[13] }, { 1020: jodates[13] }],
        },
      },
    },
    {
      type: "doc",
      label: "8.1 - Déploiement ",
      id: "cours/deploiement",
      customProps: {
        avancementLabel: "TP3",
        avancement: 0.5,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[14] }],
          "Joris": [{ 1010: jodates[14] }, { 1020: jodates[14] }],
        },
      },
    },
    {
      type: "doc",
      label: "8.2 - Règles de validation",
      id: "cours/integration",
      customProps: {
        avancementLabel: "TP3",
        avancement: 0.6,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[15] }],
          "Joris": [{ 1010: jodates[15] }, { 1020: jodates[15] }],
        },
      },
    },
    {
      type: "doc",
      label: "9.1 - Gestion de l'état ",
      id: "cours/gestion-etat",
      customProps: {
        avancementLabel: "TP3",
        avancement: 0.8,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[16] }],
          "Joris": [{ 1010: jodates[16] }, { 1020: jodates[16] }],
        },
      },
    },
    {
      type: "doc",
      label: "9.2 - Remise TP3 - Notifications ",
      id: "cours/notification",
      className: "remise-tp3",
      customProps: {
        avancementLabel: "TP3",
        avancement: 1.0,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[17] }],
          "Joris": [{ 1010: jodates[17] }, { 1020: jodates[17] }],
        },
      },
    },
    {
      type: "doc",
      label: "10.1 - Intégration ",
      id: "cours/integration",
      customProps: {
        avancementLabel: "TP4 - Créé",
        avancement: 0.0,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[18] }],
          "Joris": [{ 1010: jodates[18] }, { 1020: jodates[18] }],
        },
      },
    },
    {
      type: "doc",
      label: "10.2 - S'interfacer avec des IA",
      id: "cours/integration",
      customProps: {
        avancementLabel: "TP4",
        avancement: 0.1,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[19] }],
          "Joris": [{ 1010: jodates[19] }, { 1020: jodates[19] }],
        },
      },
    },
    {
      type: "doc",
      label: "11.1",
      id: "cours/integration",
      customProps: {
        avancementLabel: "TP4",
        avancement: 0.2,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[20] }],
          "Joris": [{ 1010: jodates[20] }, { 1020: jodates[20] }],
        },
      },
    },
    {
      type: "doc",
      label: "11.2 - Contrôle d'accès Firebase ",
      id: "cours/firebase-access-control",
      customProps: {
        avancementLabel: "TP4",
        avancement: 0.3,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[21] }],
          "Joris": [{ 1010: jodates[21] }, { 1020: jodates[21] }],
        },
      },
    },
    {
      type: "doc",
      label: "12.1 - Contrôle d'accès Firebase ",
      id: "cours/firebase-access-control",
      customProps: {
        avancementLabel: "TP4",
        avancement: 0.5,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[22] }],
          "Joris": [{ 1010: jodates[22] }, { 1020: jodates[22] }],
        },
      },
    },
    {
      type: "doc",
      label: "12.2 - Stockage Firebase ",
      id: "cours/firebase-storage",
      customProps: {
        avancementLabel: "TP4",
        avancement: 0.6,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[23] }],
          "Joris": [{ 1010: jodates[23] }, { 1020: jodates[23] }],
        },
      },
    },
    {
      type: "doc",
      label: "13.1 - Stream Firebase ",
      id: "cours/firebase-stream",
      customProps: {
        avancementLabel: "TP4",
        avancement: 0.7,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[24] }],
          "Joris": [{ 1010: jodates[24] }, { 1020: jodates[24] }],
        },
      },
    },
    {
      type: "doc",
      label: "13.2 - Règles d'accès Firebase ",
      id: "cours/firebase-rules",
      customProps: {
        avancementLabel: "TP4",
        avancement: 0.8,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[25] }],
          "Joris": [{ 1010: jodates[25] }, { 1020: jodates[25] }],
        },
      },
    },
    {
      type: "doc",
      label: "14.1",
      id: "cours/integration",
      customProps: {
        avancementLabel: "TP4",
        avancement: 0.9,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[26] }],
          "Joris": [{ 1010: jodates[26] }, { 1020: jodates[26] }],
        },
      },
    },
    {
      type: "doc",
      label: "14.2 - Remise TP4 - Intégration ",
      id: "cours/integration",
      className: "remise-tp4",
      customProps: {
        avancementLabel: "TP4",
        avancement: 1.0,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[26] }],
          "Joris": [{ 1010: jodates[27] }, { 1020: jodates[27] }],
        },
      },
    },
    {
      type: "doc",
      label: "15.1 - Formatif",
      id: "cours/formatif-final",
      customProps: {
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[27] }],
          "Joris": [{ 1010: jodates[28] }, { 1020: jodates[28] }],
        },
      },
    },
    {
      type: "doc",
      label: "15.2 - Examen Final (20%)",
      id: "cours/examen",
      className: "examen",
      customProps: {
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[28] }],
          "Joris": [{ 1010: jodates[29] }, { 1020: jodates[29] }],
        },
      },
    },
  ],
  tp: [
    { type: "doc", label: "TP1 - Idée d'application ", id: "tp/tp1" },
    { type: "doc", label: "TP2 - Interface graphique ", id: "tp/tp2" },
    { type: "doc", label: "TP3 - MVP ", id: "tp/tp3" },
    { type: "doc", label: "TP4 - Version finale ", id: "tp/tp4" },
  ],
};

module.exports = sidebars;
