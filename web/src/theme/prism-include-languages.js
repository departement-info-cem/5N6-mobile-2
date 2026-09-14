import siteConfig from '@generated/docusaurus.config';

const languageLoaders = {
  csharp: () => require('prismjs/components/prism-csharp.js'),
  java: () => require('prismjs/components/prism-java.js'),
  dart: () => require('prismjs/components/prism-dart.js'),
  powershell: () => require('prismjs/components/prism-powershell.js'),
};

export default function prismIncludeLanguages(PrismObject) {
  const {
    themeConfig: {prism},
  } = siteConfig;
  const {additionalLanguages} = prism;
  // Prism components work on the Prism instance on the window, while prism-
  // react-renderer uses its own Prism instance. We temporarily mount the
  // instance onto window, import components to enhance it, then remove it to
  // avoid polluting global namespace.
  // You can mutate PrismObject: registering plugins, deleting languages... As
  // long as you don't re-assign it
  globalThis.Prism = PrismObject;
  additionalLanguages.forEach((lang) => {
    const loadLanguage = languageLoaders[lang];
    if (loadLanguage === undefined) {
      throw new Error(`Langage Prism non configuré : ${lang}`);
    }
    loadLanguage();
  });
  delete globalThis.Prism;
}
