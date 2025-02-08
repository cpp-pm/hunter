#include <iostream>
#include <libp2p/multi/multiaddress.hpp>
#include <libp2p/peer/peer_id.hpp>

using namespace libp2p;

int main()
{
    auto addr = Multiaddress::create("/ip4/192.168.0.1/tcp/8080");
    std::cout << "address: " << addr.value().getStringAddress() << std::endl;

    // 创建一个 Peer ID
    auto peer_id_result = PeerId::fromBase58("QmPCh4nxk8kkj7A7KsSeYvW1Z5AB89p8s3u4FRoRhGgDZk");

    // 输出 Peer ID
    if (peer_id_result)
    {
        // 检查是否成功
        const auto& peer_id = peer_id_result.value(); // 获取 PeerId 对象
        std::cout << "Peer ID: " << peer_id.toHex() << std::endl; // 使用 toHex()
    }
    else
    {
        std::cout << "Invalid Peer ID" << std::endl;
    }

    return 0;
}
