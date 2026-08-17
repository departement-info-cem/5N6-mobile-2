// @ts-check
let jddates = {
  "1.1": "2026-08-24",
  "1.2": "2026-08-26",
  "2.1": "2026-08-31",
  "2.2": "2026-09-02",
  "3.1": "2026-09-09",
  "3.2": "2026-09-14",
  "4.1": "2026-09-16",
  "4.2": "2026-09-21",
  "5.1": "2026-09-23",
  "5.2": "2026-09-28",
  "6.1": "2026-09-30",
  "6.2": "2026-10-06",
  "7.1": "2026-10-07",
  "7.2": "2026-10-19",
  "8.1": "2026-10-21",
  "8.2": "2026-10-26",
  "9.1": "2026-10-28",
  "9.2": "2026-11-02",
  "10.1": "2026-11-04",
  "10.2": "2026-11-09",
  "11.1": "2026-11-16",
  "11.2": "2026-11-18",
  "12.1": "2026-11-23",
  "12.2": "2026-11-25",
  "13.1": "2026-11-30",
  "13.2": "2026-12-02",
  "14.1": "2026-12-07",
  "14.2": "2026-12-09",
  "15.1": "2026-12-14",
  "15.2": "2026-12-23",
};

let podates = {
  "1.1": "2026-06-09",
  "1.2": "2026-06-09",
  "2.1": "2026-06-10",
  "2.2": "2026-06-10",
  "3.1": "2026-06-12",
  "3.2": "2026-06-12",
  "4.1": "2026-06-15",
  "4.2": "2026-06-15",
  "5.1": "2026-06-17",
  "5.2": "2026-06-17",
  "6.1": "2026-06-19",
  "6.2": "2026-06-19",
  "7.1": "2026-06-22",
  "7.2": "2026-06-22",
  "8.1": "2026-06-23",
  "8.2": "2026-06-23",
  "9.1": "2026-06-26",
  "9.2": "2026-06-26",
  "10.1": "2026-06-29",
  "10.2": "2026-06-29",
  "11.1": "2026-06-30",
  "11.2": "2026-06-30",
  "12.1": "2026-07-03",
  "12.2": "2026-07-03",
  "13.1": "2026-07-06",
  "13.2": "2026-07-06",
  "14.1": "2026-07-08",
  "14.2": "2026-07-08",
  "15.1": "2026-07-10",
  "15.2": "2026-07-10",
};

/** @type {import('@docusaurus/plugin-content-docs').SidebarsConfig} */
const sidebars = {
  docs: [
    {
      type: "doc",
      id: "cours/intro",
      customProps: {
        avancementLabel: "TP1 - Créé",
        avancement: 0,
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates["1.1"] }],
          Joris: [{ 1020: jddates["1.1"] }],
        },
      },
    },
    {
      type: "doc",
      id: "cours/mise-en-page",
      className: "remise-tp1",
      customProps: {
        avancementLabel: "TP1",
        avancement: 0.5,
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates["1.2"] }],
          Joris: [{ 1020: jddates["1.2"] }],
        },
      },
    },
    {
      type: "doc",
      id: "cours/navigation",
      customProps: {
        avancementLabel: "TP1 - Complété",
        avancement: 1,
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates["2.1"] }],
          Joris: [{ 1020: jddates["2.1"] }],
        },
      },
    },
    {
      type: "doc",
      id: "cours/liste",
      customProps: {
        avancementLabel: "TP2 - Créé",
        avancement: 0.05,
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates["2.2"] }],
          Joris: [{ 1020: jddates["2.2"] }],
        },
      },
    },
    {
      type: "doc",
      id: "cours/multilingue-reactivite",
      customProps: {
        avancementLabel: "TP2",
        avancement: 0.33,
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates["3.1"] }],
          Joris: [{ 1020: jddates["3.1"] }],
        },
      },
    },
    {
      type: "doc",
      id: "cours/image-client",
      customProps: {
        avancementLabel: "TP2",
        avancement: 0.66,
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates["6.2"] }],
          Joris: [{ 1020: jddates["6.2"] }],
        },
      },
    },
    {
      type: "doc",
      label: "4.1 - Intégration 🔨",
      id: "cours/integration",
      customProps: {
        avancementLabel: "TP2",
        avancement: 0.80,
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates["4.1"] }],
          Joris: [{ 1020: jddates["4.1"] }],
        },
      },
    },
    {
      type: "doc",
      label: "4.2 - Intégration 🔨",
      className: "remise-tp2",
      id: "cours/integration",
      customProps: {
        avancementLabel: "TP2 - Complété",
        avancement: 1,
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates["4.2"] }],
          Joris: [{ 1020: jddates["4.2"] }],
        },
      },
    },
    {
      type: "doc",
      label: "5.1 - Organisation du code 🧹",
      id: "cours/organisation",
      customProps: {
        avancementLabel: "TP3 - Créé",
        avancement: 0.1,
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates["5.1"] }],
          Joris: [{ 1020: jddates["5.1"] }],
        },
      },
    },
    {
      type: "doc",
      label: "5.2 - Image Picker 🤏",
      id: "cours/image-picker",
      customProps: {
        avancementLabel: "TP3",
        avancement: 0.1,
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates["5.2"] }],
          Joris: [{ 1020: jddates["5.2"] }],
        },
      },
    },
    {
      type: "doc",
      label: "6.1 - Image Cookie 🍪",
      id: "cours/image-cookie",
      customProps: {
        avancementLabel: "TP2",
        avancement: 0.3,
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates["6.1"] }],
          Joris: [{ 1020: jddates["6.1"] }],
        },
      },
    },

    {
      type: "doc",
      label: "7.1 - Formatif ✍️",
      id: "cours/formatif-intra",
      customProps: {
        avancementLabel: "TP2",
        avancement: 0.4,
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates["7.1"] }],
          Joris: [{ 1020: jddates["7.1"] }],
        },
      },
    },
    {
      type: "doc",
      label: "7.2 - Examen Intra (20%) ✍️",
      id: "cours/examen",
      className: "examen",
      customProps: {
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates["7.2"] }],
          Joris: [{ 1020: jddates["7.2"] }],
        },
      },
    },
    // {
    //   type: "doc",
    //   label: "8.1 - Multilingue 🌐",
    //   id: "cours/multilingue",
    //   customProps: {
    //     avancementLabel: "TP2",
    //     avancement: 0.6,
    //     calendrier: {
    //       "Pierre-Olivier": [{ 1010: podates["8.1"] }],
    //       Joris: [{ 1020: jddates["8.1"] }],
    //     },
    //   },
    // },
    {
      type: "doc",
      label: "8.2 - Déploiement 🤖",
      id: "cours/deploiement",
      customProps: {
        avancementLabel: "TP2",
        avancement: 0.7,
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates["8.2"] }],
          Joris: [{ 1020: jddates["8.2"] }],
        },
      },
    },
    {
      type: "doc",
      label: "9.1 - Gestion de l'état 💱",
      id: "cours/gestion-etat",
      customProps: {
        avancementLabel: "TP2",
        avancement: 0.9,
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates["9.1"] }],
          Joris: [{ 1020: jddates["9.1"] }],
        },
      },
    },
    {
      type: "doc",
      label: "9.2 - Notifications 🚨",
      className: "remise-tp3",
      id: "cours/notification",
      customProps: {
        avancementLabel: "TP3 - Complété",
        avancement: 1,
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates["9.2"] }],
          Joris: [{ 1020: jddates["9.2"] }],
        },
      },
    },
    {
      type: "doc",
      label: "10.1 - Intégration 🔨",
      id: "cours/integration",
      customProps: {
        avancementLabel: "TP2",
        avancement: 1,
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates["10.1"] }],
          Joris: [{ 1020: jddates["10.1"] }],
        },
      },
    },
    {
      type: "doc",
      label: "10.2 - Authentification Firebase 👮",
      id: "cours/firebase-authentification",
      customProps: {
        avancementLabel: "TP3 - Créé",
        avancement: 0.0,
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates["10.2"] }],
          Joris: [{ 1020: jddates["10.2"] }],
        },
      },
    },
    {
      type: "doc",
      label: "11.1 - Firebase Firestore 🏪",
      id: "cours/firebase-datastore",
      customProps: {
        avancementLabel: "TP3",
        avancement: 0.1,
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates["11.1"] }],
          Joris: [{ 1020: jddates["11.1"] }],
        },
      },
    },
    {
      type: "doc",
      label: "11.2 - Control d'accès Firebase 💂",
      id: "cours/firebase-access-control",
      customProps: {
        avancementLabel: "TP3",
        avancement: 0.2,
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates["11.2"] }],
          Joris: [{ 1020: jddates["11.2"] }],
        },
      },
    },
    {
      type: "doc",
      label: "12.1 - Control d'accès Firebase 💂",
      id: "cours/firebase-access-control",
      customProps: {
        avancementLabel: "TP3",
        avancement: 0.3,
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates["12.1"] }],
          Joris: [{ 1020: jddates["12.1"] }],
        },
      },
    },
    {
      type: "doc",
      label: "12.2 - Stockage Firebase 💾",
      id: "cours/firebase-storage",
      customProps: {
        avancementLabel: "TP3",
        avancement: 0.4,
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates["12.2"] }],
          Joris: [{ 1020: jddates["12.2"] }],
        },
      },
    },
    {
      type: "doc",
      label: "13.1 - Stream Firebase 🚣",
      id: "cours/firebase-stream",
      customProps: {
        avancementLabel: "TP3",
        avancement: 0.5,
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates["13.1"] }],
          Joris: [{ 1020: jddates["13.1"] }],
        },
      },
    },
    {
      type: "doc",
      label: "13.2 - Règles d'accès Firebase 📐",
      id: "cours/firebase-rules",
      customProps: {
        avancementLabel: "TP3",
        avancement: 0.6,
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates["13.2"] }],
          Joris: [{ 1020: jddates["13.2"] }],
        },
      },
    },
    {
      type: "doc",
      label: "14.1 - Hero 🦸",
      id: "cours/hero",
      customProps: {
        avancementLabel: "TP3",
        avancement: 0.8,
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates["14.1"] }],
          Joris: [{ 1020: jddates["14.1"] }],
        },
      },
    },
    {
      type: "doc",
      label: "14.2 - Intégration 🔨",
      className: "remise-tp4",
      id: "cours/integration",
      customProps: {
        avancementLabel: "TP3",
        avancement: 1,
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates["14.2"] }],
          Joris: [{ 1020: jddates["14.2"] }],
        },
      },
    },
    {
      type: "doc",
      label: "15.1 - Formatif ✍️",
      id: "cours/formatif-final",
      customProps: {
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates["15.1"] }],
          Joris: [{ 1020: jddates["15.1"] }],
        },
      },
    },
    {
      type: "doc",
      label: "15.2 - Examen Final (20%) ✍️",
      id: "cours/examen",
      className: "examen",
      customProps: {
        calendrier: {
          "Pierre-Olivier": [{ 1010: podates["15.2"] }],
          Joris: [{ 1020: jddates["15.2"] }],
        },
      },
    },
  ],
  tp: [
    {
      type: "autogenerated",
      dirName: "02-tp",
    },
  ],
  recettes: [
    {
      type: "autogenerated",
      dirName: "03-recettes",
    },
  ],
  laboratoires: [
    {
      type: "autogenerated",
      dirName: "04-laboratoires",
    },
  ],
};

module.exports = sidebars;
