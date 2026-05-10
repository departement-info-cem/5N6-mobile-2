// @ts-check
let jmdates = [
  "2025-08-22",
  "2025-08-26",
  "2025-09-02",
  "2025-09-09",
  "2025-09-16",
  "2025-09-19",
  "2025-09-23",
  "2025-09-24",
  "2025-09-26",
  "2025-10-03",
  "2025-10-21",
  "2025-10-21",
  "2025-10-07",
  "2025-10-10",
  "2025-10-28",
  "2025-10-01",
  "2025-10-31",
  "2025-11-04",
  "2025-11-07",
  "2025-11-11",
  "2025-11-14",
  "2025-11-18",
  "2025-11-21",
  "2025-11-25",
  "2025-12-02",
  "2025-12-05",
  "2025-12-09",
  "2025-12-19",
  "2025-12-12",
  "2025-12-16",
];

let podates = [
  "2025-08-25",
  "2025-08-28",
  "2025-08-29",
  "2025-09-04",
  "2025-09-08",
  "2025-09-11",
  "2025-09-15",
  "2025-09-18",
  "2025-09-22",
  "2025-09-25",
  "2025-09-29",
  "2025-10-02",
  "2025-10-06",
  "2025-10-09",
  "2025-10-20",
  "2025-10-23",
  "2025-10-27",
  "2025-10-30",
  "2025-11-03",
  "2025-11-10",
  "2025-11-13",
  "2025-11-17",
  "2025-11-20",
  "2025-11-27",
  "2025-12-01",
  "2025-12-04",
  "2025-12-08",
  "2025-12-11",
  "2025-12-15",
];

/** @type {import('@docusaurus/plugin-content-docs').SidebarsConfig} */
const sidebars = {
  docs: [
    {
      type: "doc",
      label: "1.1 - Intro \U0001f3c1",
      id: "cours/intro",
      customProps: {
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[0] }],
          "Jean-Michel": [{ 1010: jmdates[0] }, { 1020: jmdates[0] }],
        },
      },
    },
    {
      type: "doc",
      label: "1.2 - Mise en page \U0001f4c4",
      id: "cours/mise-en-page",
      customProps: {
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[1] }],
          "Jean-Michel": [{ 1010: jmdates[1] }, { 1020: jmdates[1] }],
        },
      },
    },
    {
      type: "doc",
      label: "2.1 - Navigation \U0001f9ed",
      id: "cours/navigation",
      className: "remise-tp1",
      customProps: {
        avancementLabel: "TP1",
        avancement: 1.0,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[2] }],
          "Jean-Michel": [{ 1010: jmdates[2] }, { 1020: jmdates[2] }],
        },
      },
    },
    {
      type: "doc",
      label: "2.2 - Liste \U0001f4cb",
      id: "cours/liste",
      customProps: {
        avancementLabel: "TP2 - Cr\u00e9\u00e9",
        avancement: 0.0,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[3] }],
          "Jean-Michel": [{ 1010: jmdates[3] }, { 1020: jmdates[3] }],
        },
      },
    },
    {
      type: "doc",
      label: "3.1 - Multilingue \U0001f310",
      id: "cours/multilingue",
      customProps: {
        avancementLabel: "TP2",
        avancement: 0.33,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[4] }],
          "Jean-Michel": [{ 1010: jmdates[4] }, { 1020: jmdates[4] }],
        },
      },
    },
    {
      type: "doc",
      label: "3.2 - Image Picker \U0001f90f",
      id: "cours/image-picker",
      customProps: {
        avancementLabel: "TP2",
        avancement: 0.67,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[5] }],
          "Jean-Michel": [{ 1010: jmdates[5] }, { 1020: jmdates[5] }],
        },
      },
    },
    {
      type: "doc",
      label: "4.1 - Int\u00e9gration \U0001f528",
      id: "cours/integration",
      customProps: {
        avancementLabel: "TP2",
        avancement: 0.9,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[6] }],
          "Jean-Michel": [{ 1010: jmdates[6] }, { 1020: jmdates[6] }],
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
          "Jean-Michel": [{ 1010: jmdates[7] }, { 1020: jmdates[7] }],
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
          "Jean-Michel": [{ 1010: jmdates[8] }, { 1020: jmdates[8] }],
        },
      },
    },
    {
      type: "doc",
      label: "5.2 - Examen papier Flutter + Organisation du code \U0001f9f9",
      id: "cours/organisation",
      className: "examen",
      customProps: {
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[9] }],
          "Jean-Michel": [{ 1010: jmdates[9] }, { 1020: jmdates[9] }],
        },
      },
    },
    {
      type: "doc",
      label: "6.1 - Authentification Firebase \U0001f46e",
      id: "cours/firebase-authentification",
      customProps: {
        avancementLabel: "TP3 - Cr\u00e9\u00e9",
        avancement: 0.0,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[10] }],
          "Jean-Michel": [{ 1010: jmdates[10] }, { 1020: jmdates[10] }],
        },
      },
    },
    {
      type: "doc",
      label: "6.2 - Firebase Firestore \U0001f3ea",
      id: "cours/firebase-datastore",
      customProps: {
        avancementLabel: "TP3",
        avancement: 0.25,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[11] }],
          "Jean-Michel": [{ 1010: jmdates[11] }, { 1020: jmdates[11] }],
        },
      },
    },
    {
      type: "doc",
      label: "7.1 - Formatif \u270f\ufe0f",
      id: "cours/formatif-intra",
      customProps: {
        avancementLabel: "TP3",
        avancement: 0.4,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[12] }],
          "Jean-Michel": [{ 1010: jmdates[12] }, { 1020: jmdates[12] }],
        },
      },
    },
    {
      type: "doc",
      label: "7.2 - Examen Intra (20%) \u270f\ufe0f",
      id: "cours/examen",
      className: "examen",
      customProps: {
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[13] }],
          "Jean-Michel": [{ 1010: jmdates[13] }, { 1020: jmdates[13] }],
        },
      },
    },
    {
      type: "doc",
      label: "8.1 - D\u00e9ploiement \U0001f916",
      id: "cours/deploiement",
      customProps: {
        avancementLabel: "TP3",
        avancement: 0.5,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[14] }],
          "Jean-Michel": [{ 1010: jmdates[14] }, { 1020: jmdates[14] }],
        },
      },
    },
    {
      type: "doc",
      label: "8.2 - R\u00e8gles de validation",
      id: "cours/integration",
      customProps: {
        avancementLabel: "TP3",
        avancement: 0.6,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[15] }],
          "Jean-Michel": [{ 1010: jmdates[15] }, { 1020: jmdates[15] }],
        },
      },
    },
    {
      type: "doc",
      label: "9.1 - Gestion de l'\u00e9tat \U0001f4b1",
      id: "cours/gestion-etat",
      customProps: {
        avancementLabel: "TP3",
        avancement: 0.8,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[16] }],
          "Jean-Michel": [{ 1010: jmdates[16] }, { 1020: jmdates[16] }],
        },
      },
    },
    {
      type: "doc",
      label: "9.2 - Remise TP3 - Notifications \U0001f6a8",
      id: "cours/notification",
      className: "remise-tp3",
      customProps: {
        avancementLabel: "TP3",
        avancement: 1.0,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[17] }],
          "Jean-Michel": [{ 1010: jmdates[17] }, { 1020: jmdates[17] }],
        },
      },
    },
    {
      type: "doc",
      label: "10.1 - Int\u00e9gration \U0001f528",
      id: "cours/integration",
      customProps: {
        avancementLabel: "TP4 - Cr\u00e9\u00e9",
        avancement: 0.0,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[18] }],
          "Jean-Michel": [{ 1010: jmdates[18] }, { 1020: jmdates[18] }],
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
          "Jean-Michel": [{ 1010: jmdates[19] }, { 1020: jmdates[19] }],
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
          "Jean-Michel": [{ 1010: jmdates[20] }, { 1020: jmdates[20] }],
        },
      },
    },
    {
      type: "doc",
      label: "11.2 - Contr\u00f4le d'acc\u00e8s Firebase \U0001f482",
      id: "cours/firebase-access-control",
      customProps: {
        avancementLabel: "TP4",
        avancement: 0.3,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[21] }],
          "Jean-Michel": [{ 1010: jmdates[21] }, { 1020: jmdates[21] }],
        },
      },
    },
    {
      type: "doc",
      label: "12.1 - Contr\u00f4le d'acc\u00e8s Firebase \U0001f482",
      id: "cours/firebase-access-control",
      customProps: {
        avancementLabel: "TP4",
        avancement: 0.5,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[22] }],
          "Jean-Michel": [{ 1010: jmdates[22] }, { 1020: jmdates[22] }],
        },
      },
    },
    {
      type: "doc",
      label: "12.2 - Stockage Firebase \U0001f4be",
      id: "cours/firebase-storage",
      customProps: {
        avancementLabel: "TP4",
        avancement: 0.6,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[23] }],
          "Jean-Michel": [{ 1010: jmdates[23] }, { 1020: jmdates[23] }],
        },
      },
    },
    {
      type: "doc",
      label: "13.1 - Stream Firebase \U0001f6a3",
      id: "cours/firebase-stream",
      customProps: {
        avancementLabel: "TP4",
        avancement: 0.7,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[24] }],
          "Jean-Michel": [{ 1010: jmdates[24] }, { 1020: jmdates[24] }],
        },
      },
    },
    {
      type: "doc",
      label: "13.2 - R\u00e8gles d'acc\u00e8s Firebase \U0001f4d0",
      id: "cours/firebase-rules",
      customProps: {
        avancementLabel: "TP4",
        avancement: 0.8,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[25] }],
          "Jean-Michel": [{ 1010: jmdates[25] }, { 1020: jmdates[25] }],
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
          "Jean-Michel": [{ 1010: jmdates[26] }, { 1020: jmdates[26] }],
        },
      },
    },
    {
      type: "doc",
      label: "14.2 - Remise TP4 - Int\u00e9gration \U0001f528",
      id: "cours/integration",
      className: "remise-tp4",
      customProps: {
        avancementLabel: "TP4",
        avancement: 1.0,
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[26] }],
          "Jean-Michel": [{ 1010: jmdates[27] }, { 1020: jmdates[27] }],
        },
      },
    },
    {
      type: "doc",
      label: "15.1 - Formatif \u270f\ufe0f",
      id: "cours/formatif-final",
      customProps: {
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[27] }],
          "Jean-Michel": [{ 1010: jmdates[28] }, { 1020: jmdates[28] }],
        },
      },
    },
    {
      type: "doc",
      label: "15.2 - Examen Final (20%) \u270f\ufe0f",
      id: "cours/examen",
      className: "examen",
      customProps: {
        calendrier: {
          "Pierre-Olivier": [{ 1030: podates[28] }],
          "Jean-Michel": [{ 1010: jmdates[29] }, { 1020: jmdates[29] }],
        },
      },
    },
  ],
  tp: [
    { type: "doc", label: "TP1 - Id\u00e9e d'application \U0001f4a1", id: "tp/tp1" },
    { type: "doc", label: "TP2 - Interface graphique \U0001f3a8", id: "tp/tp2" },
    { type: "doc", label: "TP3 - MVP \U0001f680", id: "tp/tp3" },
    { type: "doc", label: "TP4 - Version finale \U0001f3c1", id: "tp/tp4" },
  ],
};

module.exports = sidebars;
