# Chuck Norris Jokes

This application was done while the CPMDWithF course 2023 in the Innopolis University 

## Description

This application provides smooth and entertaining way to view random jokes from the [Chuck Norris Jokes API](https://api.chucknorris.io/). The only interface element is a stack of cards, which could be swiped away. Each card could be opened in the browser if double tapped.


<p float="left">
<img src="https://user-images.githubusercontent.com/35888414/220069464-554ae61c-24ad-43b2-8d17-5a06d4459162.png" width=300 alt="Card with a joke" />
<img src="https://user-images.githubusercontent.com/35888414/220069460-953344a0-9fd5-44a8-97fc-7b3913b18087.png" width=300 alt="Card when tapped once" />
<img src="https://user-images.githubusercontent.com/35888414/220069458-102d82a5-3316-4f00-8224-bc00e781b5b8.png" width=300 alt="When no cards left" />
</p>

## Code

Here I will explain ordinary, hard or interesting code solutions made in this Flutter project.

### API

This is a simple and mediocre part—it uses `dio`, and JsonSerializable with a data model. The API class itself is a singleton, and has only one statuc method for uploading the data.

### Swipe

I am using the [Appinio Swiper](https://pub.dev/packages/appinio_swiper), it provided the fancy swipable cards. However, there are some problems with reusable resources: some properties are shared incorrectly between cards, which leads to widgets having properties they don't have to have initially. For example, when each card in the deck was loading a joke via API on its own, the `appinio_swiper` reused the joke text for all next cards, thus every card had the same text on it, though according to the terminal some new data was loaded by each card. This had changed responsibilities a bit, so that the `jokes` widget started managing content for each card since then.

But there are still some problems with the library present. For example, each card has its own overlay with a provate property `_isOverlayShown`, but when you make it `true`, it seems like the current card only must change its value, but when you swipe the current card out, you discover all the other cards in the deck has the same value set to `true` too. I have no explanations to this.

### Local Text Styles

The text styles are stored in an `enum`. Each has its own `stylize` function which takes a color, and returns the text style. The main problem was to initialize a constant function, that could be taken by the `enum`, and the only option is to create an auxiliary class with static methods, the `enum` could reference to. The reason for creating such a complexe structure (instead of just `const TextStyle style`) is to be independentant from colors while using the local text styles.

### Local Colors and Shadows

Well, these are just enums with constant properties.

### Adaptive Card Text

The length of jokes could be very different, and sometimes it's to long to be shown with the default 36 dp size. So I used the [AutoSizeText](https://pub.dev/packages/auto_size_text) library to show long jokes with minimum 18 dp font size, which is much more than enough.

<img src="https://user-images.githubusercontent.com/35888414/220069451-bee81d81-aa27-4cb2-ae1e-3157dcb295fa.png" width=300 alt="Card with a long joke text" />
</p>

### Z-index focuses 

There are no such paramemeter as `z-index` in Flutter, and it was surprising to realize that in order to make joke cards "higher" than the "Next" button, you have to make Flutter draw from the bottom. So I used a `Column`, and provided its children bottom-up, and this is how cards are displayed over the Next button, when you drag them. This is a bit weird solution, because I thought this option exists only for the cases, when your interface details need to be shown bottom-up like in a message history.

Another case is to show the "Check you internet connection" message, when no cards are left in the deck. The library I used had an `onEnd` callback, which couldn't consider cases when the user has no internet connection initially. The genius idea is to make this view persistent, but put under the cards. So when the cards end... there it is! The most natural and easy behavior.

# APK

Here is the [download link](https://disk.yandex.com/d/RpLUx84w61nY-Q)





