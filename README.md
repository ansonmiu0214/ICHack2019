# Eye Travel

## Links
* [DevPost](https://devpost.com/software/eye-travel)
* [Demo](https://youtu.be/zYlW-d_g_WQ)

## Inspiration
Travelling is fun and eye-opening; yet it can also be tiring and uneasy, for instance, having to calculate the exchange rate every time you go shopping and not knowing where to get your necessity, etc. 
Imagine travelling as a visually impaired or blind person- these tiny inconveniences could turn into huge stepping stones. We aim to make the shopping experience in a foreign country easy, smooth and inclusive to __everyone__.
 
## What it does
Eye Travel aims to assist and improve the travelling experience of our travellers by providing real-time detection of merchandises, their prices and currency conversion services. It also informs users the location of nearby supermarkets and convenience stores that support visa payment, and their expected queue time. The application is essentially the ‘eye’ of our visually-impaired users- the whole flow provides voice guidance and the feature is built because we want to make travelling easier and smoother for __all__ our users. Other solutions are bespoke applications for the visually impaired - what we set out to achieve is an __all-inclusive__ experience for everyone to develop an inclusive community where everyone shares the same intuitive travel experience.
 
## How we built it
The native iOS application written in Swift leverages on-device price and object recognition, making it possible for users to get real-time currency exchange calculation, simply by pointing the camera to the price tag. The app also makes uses of various VISA APIs, such as the Merchant Search API, and Google’s FirebaseML APIs.  iOS text to speech service and other interactive were used to make the app accessible by the visually impaired ones. On-device object recognition and cached exchange rate data ensures that Eye Travel operates in offline environments abroad. These components are also extracted as services which makes it very convenient to swap in alternative implementations if necessary. For the app’s interaction with visually impaired users, we revisioned the user journey from the ground up to guide the interaction through voice commands, gesture and motion detection.
 
## Challenges we ran into
Our team had very limited experience in iOS development and it took us quite some time to familiarise with the language, set up the environment and plan our application design around the programming paradigms unique to Swift. VISA API integrations were also challenging as TLS certificates needed to be setup in addition to authentication in HTTP headers, even after consulting advice from the VISA sponsors on the day.
 
## Accomplishments that we're proud of
We learnt Swift and created an innovative native application within 24 hours. More importantly, we passionately believe that this solution is well designed for the betterment of all users and achieves our initial goal of creating a digital touchpoint for human inclusivity.
 
## What we learned
Swift is a fantastic language only if one knows how to use its powers wisely.
Also, iOS AVCapture might not give you an image with correct orientation!
 
## What's next for Eye Travel
support more different merchants
support more currencies

## Contributors
* Anson Miu
* Mary Cheng
* Sharen Choi
