# Dogs Clean Architecture

UIKit sample app that demonstrates a layered iOS implementation for a dogs catalog: presentation, navigation, domain use cases, repositories, data sources, local persistence, and test doubles.

The project uses MVP as the presentation pattern, but the main value is the separation between UI, domain, and data boundaries.

## What This Project Shows

- Coordinator-driven navigation for the login and dogs flows.
- MVP presentation layer with a `DogPresenter` that owns screen state.
- Domain use case (`DogUseCases`) that chooses between local cache and remote API.
- Repository/data-source split for Realm and network access.
- Mapping from persistence/network entities into domain models.
- Environment configuration through `Development` and `QA` xcconfig/plist files.
- Unit-test surface for presenter behavior with mock use cases and view spies.

## Architecture

```text
DogViewController
  -> DogPresenter
      -> DogUseCases
          -> DogLocalRepository
              -> DogLocalDataSource
                  -> Realm
          -> DogRemoteRepository
              -> DogRemoteDataSource
                  -> Alamofire
```

The use case checks local storage first. If local data is empty, it fetches from the remote data source, saves the response, maps entities into domain models, and returns the result to the presenter.

## Main Modules

| Path | Responsibility |
| --- | --- |
| `mvpclean1/UI` | UIKit screens, presenters, coordinators, and view contracts |
| `mvpclean1/Core/Domain` | Use cases, domain models, and mapping |
| `mvpclean1/Core/Data/Repository` | Repository boundaries for local and remote access |
| `mvpclean1/Core/Data/DataSources` | Realm and Alamofire implementations |
| `mvpclean1Tests/Mock` | Test doubles for data and domain flows |
| `mvpclean1Tests/UnitTest` | Presenter unit tests |

## Dependencies

- Alamofire for HTTP requests.
- RealmSwift for local persistence.
- Kingfisher for image loading.
- Lottie for loading/illustration animations.
- CocoaPods for dependency resolution.

## Running The Project

```sh
pod install
open mvpclean1.xcworkspace
```

Then select one of the shared schemes:

- `Development`
- `QA`
- `mvpclean1`
- `mvpclean1Tests`

## Tests

The presenter tests cover:

- success path: loading state, data assignment, and view refresh;
- failure path: loading state and error rendering.

Run from Xcode using the `mvpclean1Tests` scheme.

## Screens

### Login

![Login](https://user-images.githubusercontent.com/66708463/218383327-c3f7cc09-c569-40e4-9bd5-4381d7d1584b.png)

### Dogs

![Dogs](https://user-images.githubusercontent.com/66708463/218383348-9547f8f4-400e-4b2c-9a08-53a9047999f9.png)

## Technical Notes

- Presenter callbacks are marshalled to the main queue before updating the view.
- Tests avoid Xcode placeholder code and use explicit spies/mocks.
- The app intentionally keeps UIKit/xib screens because the goal is architecture boundaries in a legacy-compatible stack.
