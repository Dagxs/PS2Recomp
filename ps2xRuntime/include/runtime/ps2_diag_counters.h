#pragma once
// Lightweight pipeline counters for debugging what reaches the GS.
#include <atomic>
#include <cstdint>

namespace ps2diag
{
    inline std::atomic<uint64_t> vif1DmaQueued{0};   // VIF1 DMA transfers queued
    inline std::atomic<uint64_t> vif1Processed{0};   // VIF1 transfers run through the interpreter
    inline std::atomic<uint64_t> vif1Mscal{0};       // MSCAL/MSCALF commands (VU1 program starts)
    inline std::atomic<uint64_t> vif1Direct{0};      // DIRECT/DIRECTHL commands (PATH2 to GS)
    inline std::atomic<uint64_t> vif1Unpack{0};      // UNPACK commands
    inline std::atomic<uint64_t> vu1Xgkick{0};       // VU1 XGKICK (PATH1 to GS)
    inline std::atomic<uint64_t> gsVertexKick{0};    // GS vertex kicks
    inline std::atomic<uint64_t> gsDrawKick{0};      // GS vertex kicks that draw

    inline std::atomic<uint64_t> vsyncCbQueued{0};   // GS VSync callbacks queued
    inline std::atomic<uint64_t> referSema{0};       // (i)ReferSemaStatus calls
    inline std::atomic<uint64_t> referSemaNoWait{0}; // ... that reported 0 waiting threads
    inline std::atomic<uint64_t> signalSema{0};      // (i)SignalSema calls

    inline std::atomic<uint64_t> dmaByChannel[16]{}; // DMA starts by channel ((base>>12)&0xF): 8=VIF0 9=VIF1 A=GIF B=IPU

    inline void bump(std::atomic<uint64_t> &c) { c.fetch_add(1, std::memory_order_relaxed); }
}
