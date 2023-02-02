use reqwest::{Client, StatusCode};

#[tokio::test]
async fn it_works() {
    let client = Client::new();
    let response = client.get("http://127.0.0.1:8545/").send().await.unwrap();
    assert_eq!(response.status(), StatusCode::OK)
}
