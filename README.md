Here’s a clean, professional README for your Coinscope project based on your description:

---

# Coinscope

Coinscope is a cross-platform crypto wallet and market tracker that fetches real-time cryptocurrency data from the CoinGecko API. It provides detailed coin information, price charts, offline caching, and user-friendly notifications for network status. The app supports both light and dark themes.

## Features

* **Live Market Data**: Fetches coin market data directly from the CoinGecko API.
* **Coin Detail View**: Displays coin info, historical prices, and OHLC charts.
* **Offline Support**:

  * Detects no internet connection and notifies the user.
  * Loads cached coin data from local database when offline.
* **Local Database**: Uses Drift for persistent storage and efficient batch insert/update.
* **State Management**: Uses GetX for reactive UI updates.
* **Pull-to-Refresh**: Updates market data on demand or automatically every 60 seconds.
* **Themes**: Supports light and dark themes.
* **Placeholders/Loading States**: Shows shimmer effects or placeholders while fetching data


## Dependencies

* Flutter SDK
* GetX (State management)
* Drift (Local database)
* SQLite3 Flutter Libs (Mobile database support)
* cached_network_image (Image caching)
* flutter_screenutil (Responsive UI)

## Architecture

* **Controllers**: GetX controllers handle API calls, local caching, and state updates.
* **Database**: Drift manages persistent coin data with batch insert/update for efficiency.
* **Services**: API service layer interacts with CoinGecko endpoints.
* **UI**: Separate widgets for market list, detail view, charts, error handling, and loading states.

## Usage

* Launch the app to view the top coins by market cap.
* Tap a coin to view detailed information and its price chart.
* Pull down to refresh market data.
* Receive notifications when the network is unavailable.

## Contributing

1. Fork the repository.
2. Create a feature branch: `git checkout -b feature-name`
3. Commit changes: `git commit -m "Add feature"`
4. Push to the branch: `git push origin feature-name`
5. Open a pull request.
   
https://appetize.io/app/b_jbiwa7nzx6qkre6r5jepzdoif4
https://drive.google.com/drive/folders/1sA1EmVjaWuLGMFzwgWnmw-eIjXx9Tq_4?usp=sharing

## Screenshots

<img width="200" height="550" " alt="Screenshot_1762958394" src="https://github.com/user-attachments/assets/dc393828-70c9-4eb0-9162-b66f18018931" />
<img width="200" height="550" alt="Screenshot_1762958384" src="https://github.com/user-attachments/assets/e9efdc9d-bdc2-40ba-bb52-7d5355a4cd0f" />



## License
MIT License.

