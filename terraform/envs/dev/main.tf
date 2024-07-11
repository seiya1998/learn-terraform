

# デフォルトプロバイダ（awsプロバイダーの設定）
provider "aws" {
    region = "ap-northeast-1"
}

# モジュールの呼び出し
module "common" {
    source = "../../common"
    env_name = "dev"
}