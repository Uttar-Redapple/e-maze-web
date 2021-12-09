'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "6bfe3d4997916b220ab1968418bfd02b",
"assets/assets/images/abcd.png": "3c47c1f45e12b40955eec3691b1fc35f",
"assets/assets/images/addperson.png": "a882d6a16072da7a908a32ae042e069b",
"assets/assets/images/addpersonwhite.png": "231da355dabeaf0cccab8165d6fe141f",
"assets/assets/images/assertss.png": "cadbd3c1238b6d3afb86183e6d956f6f",
"assets/assets/images/assets.png": "975d06126f710452ff5379ed95d04707",
"assets/assets/images/bag.png": "e6d5b2948580edf65021af3422d12289",
"assets/assets/images/bag_gray.png": "e88629b3d495f408418c6b39337d1a5e",
"assets/assets/images/blueonline.png": "13d3583e26b36a24240482e921f3e5e1",
"assets/assets/images/communate.png": "acee8294527fee7735e27ea5ddde3b97",
"assets/assets/images/contact-gray.png": "e604d68f0ea8318063fff66ed5c37ed6",
"assets/assets/images/contact.png": "3b29aaa27e087fa35baf152ee6e75d4b",
"assets/assets/images/delete.png": "7e5c3a15633e90fa41195cf770f1e854",
"assets/assets/images/down.png": "5d668b107f4dcb82ff77f6cd510728c2",
"assets/assets/images/edit.png": "e81ff3b9452c331efd8338232a395659",
"assets/assets/images/emazelogofirst.png": "2adfa7b2e07ea1c0d040780f4bc48e6b",
"assets/assets/images/emazelogosecond.png": "9b72a56c994e6c65d5698642cea5d402",
"assets/assets/images/emazelogothird.png": "712f7154c61568d5cc8cd5dcb41d6dc2",
"assets/assets/images/eye.png": "ed05359f44b8e985c07065ee98a398fe",
"assets/assets/images/facebook.png": "b9931a3d3abed73f4cf21fd7d559a705",
"assets/assets/images/fondos.png": "7f2793dbbad861036f6788163a025589",
"assets/assets/images/forward.png": "b07eca9901c0d1e0ece6c64563f8cd7e",
"assets/assets/images/generalperef.png": "ad3e901ef000f7befc35d33168113b6c",
"assets/assets/images/google.png": "cab7a2cb13c51120a5e81a7eae37aff8",
"assets/assets/images/gp.png": "ad3e901ef000f7befc35d33168113b6c",
"assets/assets/images/greyback.png": "52ff2bd241f43a8d50f3a0b312692773",
"assets/assets/images/Group11.png": "a580f5a236ff6d88c9547a2f0e676bb2",
"assets/assets/images/Group111.png": "c31709a5ee5e947d6bf21ad84f6a6f8e",
"assets/assets/images/groups.png": "43bc2f2572ced17a7940ea26680f4d75",
"assets/assets/images/groupsnew.png": "fd3f84264f8e4a27ce60b24f2d49e2a6",
"assets/assets/images/headphone.png": "3cb5c674585363e44f28cde8bd10f1a7",
"assets/assets/images/home.png": "22f421d7b56d5285c59de063b57315b0",
"assets/assets/images/homes_gray.png": "6e3bc61394a6472704b611d3cfc1a2e7",
"assets/assets/images/key.png": "51c326ce507f9706af2fc6cbc652e913",
"assets/assets/images/language.png": "4dc0cb95024420a33acf6a5aa3a06ce2",
"assets/assets/images/lock-gray.png": "a2fbf574321b856eabe61f823faf7fe6",
"assets/assets/images/lock.png": "7a9461c98d6c075385cd3cc78e84878c",
"assets/assets/images/login.png": "ab65e25f1d01daa8cd102c5362f7bcbc",
"assets/assets/images/loginagain.png": "e723d22ac06a44b615b2665a507c8198",
"assets/assets/images/logous.png": "677698f455c82f354893d8bb38d29c75",
"assets/assets/images/logout.png": "4192f821693ed1ea798f3293918e9f97",
"assets/assets/images/menu.png": "4501b64f6892711a71ead812bde0df60",
"assets/assets/images/message-gray.png": "6e03b30907f16f19cd3f08b5ee4d3486",
"assets/assets/images/message.png": "10b3a1abdf1d80652f72d2ca1d006179",
"assets/assets/images/messages.png": "ca302895ec94af9e6933e3caa4d3a3e7",
"assets/assets/images/notification.png": "9f375258a460768680798d95e7fa8330",
"assets/assets/images/offline.png": "318415460c23d1671f7cb59d9215c4f1",
"assets/assets/images/online.png": "a6ce29444d2c26da18c327e8996c4e44",
"assets/assets/images/payment.png": "f1ba59d2e80bc3772fdef3019d96a713",
"assets/assets/images/performance.png": "060ac86056baa1d4979143d59941ca9f",
"assets/assets/images/pfondo.png": "bc8824b2e4afdacff896a5de7e4dfc41",
"assets/assets/images/play.png": "be1f5424d1161b10d799f7c2a7f85527",
"assets/assets/images/poligon.png": "7157317a209e736077a062d10cf17c24",
"assets/assets/images/profile.png": "e9521322ef6d68199701960ce9d0062e",
"assets/assets/images/re.png": "c1be0688ccb59ce48a4d21a0f11c07b4",
"assets/assets/images/rectangle.png": "3369fe18def4d5b428e20957ae94d3a6",
"assets/assets/images/refresh.png": "ddfaa6673e9e23d696007cc1d1d5a746",
"assets/assets/images/regagain.png": "5828bd90b3542cbdaf0da1edffefef0c",
"assets/assets/images/reload.png": "d0d663eed9498a9944355512f4c5a5f7",
"assets/assets/images/reloadicon.png": "8c2262ab1a42211b4afc71a95aa9e01c",
"assets/assets/images/reminder.png": "1a1aaa80418972704b0275a4df604d35",
"assets/assets/images/report.png": "060ac86056baa1d4979143d59941ca9f",
"assets/assets/images/search.png": "dfc949c55293026f732ccd72e06728e9",
"assets/assets/images/sett.png": "182c6c88417578b717cd3aa105973c2e",
"assets/assets/images/setting.png": "eb115888f2dfb4a52f0d4dcf43b8733f",
"assets/assets/images/shadow.png": "3140a447489f3e89e6b31f56d632207f",
"assets/assets/images/share.png": "e3ff29d63e48760590b465ef28999a71",
"assets/assets/images/smiley.png": "ec0661f7b38fa38835300e6df9ac6da5",
"assets/assets/images/spec.png": "9c43ee3576d807ae1ce5b34948c3a34e",
"assets/assets/images/spec_gray.png": "19a45712a658612291d5b0ede4c5427c",
"assets/assets/images/switchbox.png": "790ac30114751af9e8c706b8bf048787",
"assets/assets/images/tabicon.png": "6afd540d21882be74628325c76bf378c",
"assets/assets/images/tick.png": "b47cac07400b0c8469060fc08c9155f8",
"assets/assets/images/ticknew.png": "ccbbb4f55d70224ef48fa3a599b0a4e4",
"assets/assets/images/tip.png": "6af82f642bf03b7298d9efd6684001ee",
"assets/assets/images/twitter.png": "0d22786b027c8949163472fb4fd02446",
"assets/assets/images/up.png": "af4131763811be2161d63f0449dd711e",
"assets/assets/images/username-gray.png": "a1dfe0ac5d29f471a9622dbd69e2a8e0",
"assets/assets/images/username.png": "4ad8f9ea4efbf63bc58b5de703233a1c",
"assets/assets/images/userprofile.png": "728ba7cbdcbe79a5faca4d91fc44a8d0",
"assets/assets/images/verify.png": "43c91e5361ea6825badbab99aefafd84",
"assets/assets/images/warining.png": "8e2273787f93cdc7983e2d58d1ee0216",
"assets/assets/images/whitepoligon.png": "b9d45aeae56ccfc60d8f92619bdbf91b",
"assets/FontManifest.json": "ed4f652bbaedd1733893faaaf4dacf07",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/NOTICES": "fd21dd182518a04cb1e4a82400646571",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/fluttertoast/assets/toastify.js": "e7006a0a033d834ef9414d48db3be6fc",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_AMS-Regular.ttf": "657a5353a553777e270827bd1630e467",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Caligraphic-Bold.ttf": "a9c8e437146ef63fcd6fae7cf65ca859",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Caligraphic-Regular.ttf": "7ec92adfa4fe03eb8e9bfb60813df1fa",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Fraktur-Bold.ttf": "46b41c4de7a936d099575185a94855c4",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Fraktur-Regular.ttf": "dede6f2c7dad4402fa205644391b3a94",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Main-Bold.ttf": "9eef86c1f9efa78ab93d41a0551948f7",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Main-BoldItalic.ttf": "e3c361ea8d1c215805439ce0941a1c8d",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Main-Italic.ttf": "ac3b1882325add4f148f05db8cafd401",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Main-Regular.ttf": "5a5766c715ee765aa1398997643f1589",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Math-BoldItalic.ttf": "946a26954ab7fbd7ea78df07795a6cbc",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Math-Italic.ttf": "a7732ecb5840a15be39e1eda377bc21d",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_SansSerif-Bold.ttf": "ad0a28f28f736cf4c121bcb0e719b88a",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_SansSerif-Italic.ttf": "d89b80e7bdd57d238eeaa80ed9a1013a",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_SansSerif-Regular.ttf": "b5f967ed9e4933f1c3165a12fe3436df",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Script-Regular.ttf": "55d2dcd4778875a53ff09320a85a5296",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Size1-Regular.ttf": "1e6a3368d660edc3a2fbbe72edfeaa85",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Size2-Regular.ttf": "959972785387fe35f7d47dbfb0385bc4",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Size3-Regular.ttf": "e87212c26bb86c21eb028aba2ac53ec3",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Size4-Regular.ttf": "85554307b465da7eb785fd3ce52ad282",
"assets/packages/flutter_math_fork/lib/katex_fonts/fonts/KaTeX_Typewriter-Regular.ttf": "87f56927f1ba726ce0591955c8b3b42d",
"assets/packages/flutter_neumorphic/fonts/NeumorphicIcons.ttf": "32be0c4c86773ba5c9f7791e69964585",
"assets/packages/wakelock_web/assets/no_sleep.js": "7748a45cd593f33280669b29c2c8919a",
"canvaskit/canvaskit.js": "43fa9e17039a625450b6aba93baf521e",
"canvaskit/canvaskit.wasm": "04ed3c745ff1dee16504be01f9623498",
"canvaskit/profiling/canvaskit.js": "f3bfccc993a1e0bfdd3440af60d99df4",
"canvaskit/profiling/canvaskit.wasm": "a9610cf39260f60fbe7524a785c66101",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "3636582e4c3cb037682028e577667aad",
"/": "3636582e4c3cb037682028e577667aad",
"main.dart.js": "0b3d10f3c7e12c808902184b351a8bcb",
"manifest.json": "c5579b7aad76a50cfdb9a92e58476fa0",
"version.json": "21eb5b0e6da402b746c863119972a629",
"web.zip": "f18b5572d08aed41dc8b8ee8855de609"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
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
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
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
