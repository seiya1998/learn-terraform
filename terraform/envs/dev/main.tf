terraform {
    backend "s3" {
        bucket = "dev-example-tfstate"
        key = "terraform.tfstate"
        region = "ap-northeast-1"
    }
}

# デフォルトプロバイダ（awsプロバイダーの設定）
# awsにリソースを作成するためのプロバイダーを指定
provider "aws" {
    region = "ap-northeast-1"
}

# モジュールの呼び出し
module "common" {
    source = "../../common"
    env_name = "dev"
}