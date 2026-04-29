// components/ArtworkCard.jsx
import { View, Text, Image, StyleSheet, TouchableOpacity } from "react-native"
import { colors } from "../constants/colors"

export default function ArtworkCard({ title, artist, imageUrl, forSale, onPress }) {
  return (
    <TouchableOpacity style={styles.card} onPress={onPress}>
      <Image source={{ uri: imageUrl || "https://placehold.co/400x300/3D2314/F5ECD7?text=Artwork" }} style={styles.image} />
      <View style={styles.info}>
        <Text style={styles.title}>{title || "Untitled"}</Text>
        <Text style={styles.artist}>{artist || "Unknown Artist"}</Text>
        <View style={styles.badge}>
          <Text style={styles.badgeText}>✓ Verified</Text>
        </View>
        {forSale && <Text style={styles.sale}>For Sale</Text>}
      </View>
    </TouchableOpacity>
  )
}

const styles = StyleSheet.create({
  card: {
    backgroundColor: colors.card,
    borderRadius: 14,
    marginBottom: 16,
    overflow: "hidden",
  },
  image: {
    width: "100%",
    height: 200,
  },
  info: {
    padding: 14,
  },
  title: {
    color: colors.cream,
    fontSize: 16,
    fontWeight: "700",
  },
  artist: {
    color: colors.subtext,
    fontSize: 13,
    marginTop: 4,
  },
  badge: {
    marginTop: 8,
    backgroundColor: colors.verified + "33",
    alignSelf: "flex-start",
    paddingHorizontal: 10,
    paddingVertical: 4,
    borderRadius: 20,
    borderWidth: 1,
    borderColor: colors.verified,
  },
  badgeText: {
    color: colors.verified,
    fontSize: 12,
    fontWeight: "600",
  },
  sale: {
    color: colors.primary,
    fontSize: 13,
    marginTop: 6,
    fontWeight: "600",
  },
})
