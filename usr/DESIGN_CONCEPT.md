# Aura: Offline P2P Social Platform Concept

## 1. Core Features

### Content Creation
- **Media Types**: Short videos (up to 60s), photos, and text-based "shouts".
- **Editing Tools**: Basic filters, trimming, and text overlays processed locally on the device.
- **Drafts**: All content is saved locally as drafts until "broadcasted".

### Feeds
- **Local Feed**: Shows content from currently connected peers (Bluetooth/Wi-Fi range).
- **Cached Feed**: Shows content synced from previous encounters, sorted by relevance and recency.
- **Discovery**: A "Nearby" radar view showing active peers in the vicinity.

### Profiles
- **Identity**: Cryptographic public key serves as the User ID. Display name and avatar are mutable metadata.
- **Stats**: "Trust Score" (based on interactions), "Reach" (how many devices hold your content).
- **Portfolio**: Grid view of shared media stored on the device.

### Reactions & Messaging
- **Offline Likes/Comments**: Interactions are signed transactions appended to the content's metadata.
- **P2P Messaging**: End-to-End Encrypted (E2EE) direct messages. Messages queue until devices are in range or passed via a "data mule" (intermediate peer).

## 2. P2P Content Distribution

### Synchronization (Gossip Protocol)
- **Discovery**: Devices advertise presence via BLE (Bluetooth Low Energy) or Wi-Fi Direct Service Discovery.
- **Handshake**: Upon connection, devices exchange "Vector Clocks" or "Bloom Filters" to determine missing content.
- **Prioritization**: Content is prioritized by:
    1. Direct subscriptions (Friends).
    2. High engagement (Viral local content).
    3. Physical proximity (Content created nearby).

### Caching & Replication
- **Storage Quota**: Users set a limit (e.g., 2GB) for caching others' content.
- **Eviction Policy**: Least Recently Used (LRU) + Least Engaged.
- **Ephemeral Content**: "Stories" automatically delete from cache after 24 hours to save space.

## 3. Privacy & Security

### Encryption
- **Transport**: TLS 1.3 over local sockets.
- **Storage**: SQLCipher for local database encryption.
- **E2EE**: Signal Protocol for private messaging.

### Identity & Consent
- **Decentralized ID (DID)**: No phone numbers or emails. Users generate a key pair on first launch.
- **WoT (Web of Trust)**: Users verify friends by scanning QR codes physically, creating a trusted subnet.
- **Content Scoping**:
    - *Public*: Broadcast to anyone.
    - *Friends Only*: Encrypted with a shared group key.

## 4. User Experience (UX)

- **Visual Style**: Dark mode default (battery saving). Minimalist UI to focus on content.
- **Connectivity Indicators**: Prominent "Signal Strength" icon indicating P2P density (not internet).
- **Sync Status**: Visual feedback (e.g., a pulsing ring) when syncing data with a nearby peer.
- **Feed Interaction**: Vertical swipe (TikTok style) for immersive media, horizontal swipe for profile details.

## 5. Use Cases

- **Festivals/Concerts**: Sharing clips when cellular networks are overloaded.
- **Remote Education**: Teachers distributing assignments to students' tablets in areas without internet.
- **Protests/Activism**: Secure communication immune to ISP shutdowns.
- **Travel**: Backpackers sharing tips and photos in remote hostels.

## 6. Technical Architecture

- **Stack**: Flutter (UI), Rust/C++ (Core P2P Logic via FFI).
- **Database**: SQLite (Metadata), File System (Media Blobs).
- **Protocols**:
    - *Transport*: Wi-Fi Aware, Wi-Fi Direct, BLE.
    - *Sync*: Scuttlebutt (SSB) or custom CRDT (Conflict-free Replicated Data Type) based protocol.
- **Conflict Resolution**: CRDTs ensure that if two users edit a shared object (like a comment thread), both changes merge eventually without conflicts.

## 7. Limitations & Mitigation

- **Battery Drain**: Constant discovery is expensive. *Mitigation*: Adaptive scanning intervals (scan less frequently when stationary).
- **Storage**: Phones have limited space. *Mitigation*: Aggressive compression and user-defined quotas.
- **Content Moderation**: No central authority to ban bad actors. *Mitigation*: "Block" lists shared between trusted peers (User-moderated distributed blocklists).
- **Latency**: Propagation is slow (physical movement required). *Mitigation*: "Data Mules" - encouraging users to move around to spread data.
