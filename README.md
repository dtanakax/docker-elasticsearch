![License MIT](https://img.shields.io/badge/license-MIT-blue.svg)

docker-elasticsearch
=====================

Base Docker Image
---------------------

[dtanakax/java8](https://registry.hub.docker.com/u/dtanakax/docker-java8)

説明
---------------------

Elasticsearch Dockerコンテナ作成設定

使用方法
---------------------

起動

    $ docker run -d -p 9200:9200 -p 9300:9300 -ti dtanakax/elasticsearch

ブラウザで表示

    http://<hostname>:9200

クラスタ構成について
---------------------

以下は3ノードのクラスタ構成設定例です。

1. マスターを起動

        $ docker run --name <name> \
                -d -p 9200:9200 -p 9300:9300 \
                -e NODE_NAME=master \
                -e NODE_MASTER=true \
                -e NODE_DATA=false

2. スレーブを起動

        $ docker run --name <name> \
                -e NODE_NAME=slave1 \
                -e NODE_MASTER=false \
                -e NODE_DATA=true

        $ docker run --name <name> \
                -e NODE_NAME=slave2 \
                -e NODE_MASTER=false \
                -e NODE_DATA=true

環境変数
---------------------

- `NODE_NAME` クラスタ構成時のノード名
- `NODE_MASTER` クラスタ構成時マスターノード指定 true or false
- `NODE_DATA` クラスタ構成時データを保持 true or false

利用可能なボリューム
---------------------

    /opt/elasticsearch/config       # Elasticsearch 設定ファイル
    /data                           # Elasticsearch データ

License
---------------------

The MIT License
Copyright (c) 2015 Daisuke Tanaka

以下に定める条件に従い、本ソフトウェアおよび関連文書のファイル（以下「ソフトウェア」）の複製を取得するすべての人に対し、ソフトウェアを無制限に扱うことを無償で許可します。これには、ソフトウェアの複製を使用、複写、変更、結合、掲載、頒布、サブライセンス、および/または販売する権利、およびソフトウェアを提供する相手に同じことを許可する権利も無制限に含まれます。

上記の著作権表示および本許諾表示を、ソフトウェアのすべての複製または重要な部分に記載するものとします。

ソフトウェアは「現状のまま」で、明示であるか暗黙であるかを問わず、何らの保証もなく提供されます。ここでいう保証とは、商品性、特定の目的への適合性、および権利非侵害についての保証も含みますが、それに限定されるものではありません。 作者または著作権者は、契約行為、不法行為、またはそれ以外であろうと、ソフトウェアに起因または関連し、あるいはソフトウェアの使用またはその他の扱いによって生じる一切の請求、損害、その他の義務について何らの責任も負わないものとします。

The MIT License
Copyright (c) 2015 Daisuke Tanaka

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.