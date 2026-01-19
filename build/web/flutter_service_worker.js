'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "9f0febc9ceffbbaa0d8544e78f464808",
"assets/AssetManifest.bin.json": "b29e8b62a14d6c8ab3c6f83ee5bcde20",
"assets/assets/images/BackgroundBoat.webp": "2b0b3e365d2598911c3286dd3d79c9cb",
"assets/assets/images/certificates/certificate_bloc.webp": "213518fc58f3ee190937dddaf4d60e53",
"assets/assets/images/certificates/certificate_crud_mongoDb.webp": "f2e6307b6658894669e7d68089bc25c6",
"assets/assets/images/certificates/certificate_dart_mastery.webp": "7a87fc84d2049e4ca19ae4c1cd77b9a5",
"assets/assets/images/certificates/certificate_flutter_rest_app.webp": "6bb2672f4d24e6bd8c9b0dd231fac23c",
"assets/assets/images/certificates/certificate_flutter_zero_project.webp": "48e5f65042db3e7463e965e07c0fd7ae",
"assets/assets/images/certificates/certificate_introduction_data_science.webp": "fb280b488599dc1be4f321b7feb0ed7e",
"assets/assets/images/certificates/certificate_iot.webp": "d4095298a2f8f01f95a719c7161bfa86",
"assets/assets/images/certificates/certificate_java.webp": "92b2036ad8a690169eb04ae73ba4e3a9",
"assets/assets/images/certificates/certificate_programming_c.webp": "4209175c800cdc80bd60a5ebe3ced583",
"assets/assets/images/certificates/certificate_react_ai.webp": "eddb7203eb5339007be64050931865ca",
"assets/assets/images/certificates/certificate_santander.jpg": "f0c4d2e24c024fb64c293801ca8d3546",
"assets/assets/images/certificates/certificate_spring_ai.webp": "3815bec77bb1256e14c8613e32010268",
"assets/assets/images/certificates/premioAlgeciras.webp": "7377458918432facfa1dd8d9dc9e6fd1",
"assets/assets/images/certificates/technologia5gIA.webp": "bab6b1f4c6859ac4ea14aae31b5ab951",
"assets/assets/images/NoWork.webp": "413b753521babfb4ed8337c5ba58bb3a",
"assets/assets/images/personal.avif": "9b768de13fe9ed29755e2b413de83500",
"assets/assets/images/personal.webp": "bcf10205696d1ba1a36b5d0793b225c5",
"assets/assets/images/projects/appStudent/1.webp": "6f3f94574c3fbb043b3210e744a65280",
"assets/assets/images/projects/appStudent/1_full.webp": "d9e0cc3b8e83793b9809d8586de25a9d",
"assets/assets/images/projects/appTeacher/1.webp": "b773a2b4e7d4ce1c944d3fdc41fdfbd8",
"assets/assets/images/projects/appTeacher/1_full.webp": "0dad741f00f33834bdadaa0e2452e2ad",
"assets/assets/images/projects/gomoku/1.webp": "2cee61abd942f253a6e657d20e459d43",
"assets/assets/images/projects/gomoku/1_full.webp": "fe270b53afac66b5180b978c7bc46bb4",
"assets/assets/images/projects/goReversi/1.webp": "d348c1824defd37d3d581edfca67ddca",
"assets/assets/images/projects/goReversi/1_full.webp": "b0ea4f45bcb7415febc2a669c0019cd8",
"assets/assets/images/projects/imcCalculator/1.webp": "afbf31db9d65b85d096242a4388159e0",
"assets/assets/images/projects/imcCalculator/1_full.webp": "e40f9672c52f9c6ec9cb12aa23abdcf5",
"assets/assets/images/projects/paintVanilla/1.webp": "c4ae3e7cc10028cb472d52f0a3403296",
"assets/assets/images/projects/paintVanilla/1_full.webp": "457c525c7f1d4a16d1ae122d4eb512a2",
"assets/assets/images/projects/pokeApi/1.webp": "fab8fa483f8da813505d1498a7af3bc0",
"assets/assets/images/projects/pokeApi/1_full.webp": "dd23f6c4840a5f8641e24b0531b3e5c5",
"assets/assets/images/projects/tasty/1.webp": "181bb228dadfbf9ab5b23f97da6ef1f2",
"assets/assets/images/projects/tasty/1_full.webp": "9595e77e627b6c71aba1c2c6b2e36a26",
"assets/assets/images/projects/ticTacToe/1.webp": "dc4dd5fe37b3b2ebd6acf982109e5829",
"assets/assets/images/projects/ticTacToe/1_full.webp": "de41489986acd71c08cf144114511ef1",
"assets/assets/images/projects/ultraRestaurant/1.webp": "7054870e00a4429950668b775c98b538",
"assets/assets/images/projects/ultraRestaurant/1_Full.webp": "90de0929f1f330e8c5fc8d4284a5c744",
"assets/assets/pdf/Curriculum_Alejandro_Aguilar_Alba.pdf": "df4e994c1208c0c8a150f0bec3904eeb",
"assets/assets/svg/certificate.svg": "5d64f41e587e1793dc03224c9697a4e6",
"assets/assets/svg/eclipse.svg": "468d03d6934af4cea7a4175ba3d6c94a",
"assets/assets/svg/git.svg": "5eed2c8cb62e1adfae09b0129a25a1a7",
"assets/assets/svg/github.svg": "91fc7cd187b65073322024169d2cd416",
"assets/assets/svg/intellij.svg": "12dd7832374a7b7f9406c6ed7388e908",
"assets/assets/svg/languageCode.svg": "e47c7b88f48bb2099d51e23f40ec8f82",
"assets/assets/svg/linkedin.svg": "2c20928ddc18c3e2ac70e6f8f38ca825",
"assets/assets/svg/programLanguage/android.svg": "591117075fc95dd71b6a3563a08766fd",
"assets/assets/svg/programLanguage/css.svg": "97e0b59800bc30b5c18a7b12dfbbaf6d",
"assets/assets/svg/programLanguage/dart.svg": "77736b70355db3b992d712891749acd5",
"assets/assets/svg/programLanguage/firebase.svg": "4e81eead83acdcbe873a2297c4ca83aa",
"assets/assets/svg/programLanguage/flutter.svg": "9a6e81be6ff5b09956f4f85fe1f0a89f",
"assets/assets/svg/programLanguage/html.svg": "10328348fe4795e4153dd39118804af4",
"assets/assets/svg/programLanguage/java.svg": "45f6ff15dcfe17b99a87bcbd6f9d7582",
"assets/assets/svg/programLanguage/javascript.svg": "ca60a139a15167ae52f9d9b65cb718ad",
"assets/assets/svg/programLanguage/kotlin.svg": "54972a0c9408fceebecbf6a0b0229d11",
"assets/assets/svg/programLanguage/maui.svg": "37258a983459ae1c2e4f1e551665f388",
"assets/assets/svg/programLanguage/mongoDb.svg": "50c2dcb538382c9ae419739112624d9e",
"assets/assets/svg/programLanguage/mysql.svg": "088fa127aac415780022cd8ef7970383",
"assets/assets/svg/programLanguage/php.svg": "e26767d241095e15f840c5b5d376a649",
"assets/assets/svg/programLanguage/python.svg": "26f5129d3abd6d3232bcd2d8cd80a012",
"assets/assets/svg/programLanguage/react.svg": "f0340143227cc3546b667fd9c4d1e1d8",
"assets/assets/svg/programLanguage/spring.svg": "1c963b52830704f69efe489b3b1167a6",
"assets/assets/svg/project.svg": "af443ef75dc06fa5a0d7760cf931829d",
"assets/assets/svg/visualStudio.svg": "ec257ddd94fa88701961ccd3bfda37db",
"assets/assets/svg/visualStudioCode.svg": "a0f33ad8ad533f1dd3a77bf2f100edae",
"assets/assets/svg/web.svg": "4af5a71f843c1ee0394219b923dee09b",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "dbf6e4b788b91e5b73dbccadfa7f4255",
"assets/NOTICES": "a4d7660f80652effce71f62b988f41dd",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "99efbce4be9744f2b7770782a4826c2d",
"assets/packages/wakelock_plus/assets/no_sleep.js": "7748a45cd593f33280669b29c2c8919a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01",
"Curriculum_Alejandro_Aguilar_Alba.pdf": "df4e994c1208c0c8a150f0bec3904eeb",
"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"flutter_bootstrap.js": "1c8973740a706b9de478ae6af6a12e36",
"icons/languageCode.svg": "e47c7b88f48bb2099d51e23f40ec8f82",
"index.html": "d10de0223a2b9c9f885f17aa3e8e046a",
"/": "d10de0223a2b9c9f885f17aa3e8e046a",
"main.dart.js": "1d56770ca44f8ac8c61ebb27c54d74b3",
"main.dart.js_1.part.js": "57bea0891e001e37ee07e71dd1bbe223",
"main.dart.js_2.part.js": "b5d6abcd8ff17a53eb8861f09a822c62",
"main.dart.js_3.part.js": "2c53ef3986ac096a52bb61c4da49f168",
"main.dart.js_4.part.js": "76f6dcb3cac80fc0912a21b019672709",
"main.dart.mjs": "f830d1a99aaf4aa78d1790420f6c1351",
"main.dart.wasm": "24467f12c4b69c01436ffe344a00c95a",
"manifest.json": "c832c626ec944a24ae260b3cbb479bec",
"robots.txt": "0fdc4529a6b38b47bd4f63793b087017",
"sitemap.xml": "a7f6ac0b5e488c721c80b076aa8e4a98",
"version.json": "875a719c6a564058c9e63c6f2853302f"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"main.dart.wasm",
"main.dart.mjs",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
