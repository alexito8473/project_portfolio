'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"404.html": "0a27a4163254fc8fce870c8cc3a3f94f",
"assets/AssetManifest.bin": "b0887643da06bb2c838651a77b365199",
"assets/AssetManifest.bin.json": "5576e29940a39d289a8b4f82e3e1e293",
"assets/AssetManifest.json": "a7d1caa3c6b5fa911147dcd3877c9c82",
"assets/assets/images/BackgroundBoat.webp": "2b0b3e365d2598911c3286dd3d79c9cb",
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
"assets/assets/pdf/Curriculum_Alejandro_Aguilar.pdf": "3d0e5cb42ef7b745ee235bd84e89380d",
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
"assets/fonts/MaterialIcons-Regular.otf": "748020b8b48f800026a496c667f224af",
"assets/NOTICES": "537f241ce16aa226e7567d135d0602b9",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e85f81421cba2b29f95d75066c7c09a6",
"assets/packages/mobkit_dashed_border/images/type1.png": "9f8e612a54622229bd4b97e5357a473c",
"assets/packages/mobkit_dashed_border/images/type2.png": "17a23dec244c3d1bb5b4ae67d7bd48b3",
"assets/packages/mobkit_dashed_border/images/type3.png": "2d50ab9d78a15b2f20012c3b9ea56c46",
"assets/packages/mobkit_dashed_border/images/type4.png": "9250b4ccf17768b5c7d6afcaebadf3f9",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "403efd2d5bbc5183d1b9ef358f4181d2",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/languageCode.svg": "e47c7b88f48bb2099d51e23f40ec8f82",
"index.html": "19a580a2f89d273e3cab73c582565d02",
"/": "19a580a2f89d273e3cab73c582565d02",
"main.dart.js": "0e654b98a9ef1f80e82b89773f00e36b",
"manifest.json": "f471a7c0d026d4db558873a2525269b2",
"version.json": "875a719c6a564058c9e63c6f2853302f"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
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
