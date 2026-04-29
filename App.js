// App.js
import { NavigationContainer } from "@react-navigation/native"
import { createStackNavigator } from "@react-navigation/stack"
import Welcome from "./app/index"
import RoleSelect from "./app/role-select"
import Home from "./app/home"
import ScanArtist from "./app/scan-artist"
import ScanCollector from "./app/scan-collector"
import Dashboard from "./app/dashboard"
import Artwork from "./app/artwork"
import Profile from "./app/profile"
import KYC from "./app/kyc"

const Stack = createStackNavigator()

export default function App() {
  return (
    <NavigationContainer>
      <Stack.Navigator screenOptions={{ headerShown: false }}>
        <Stack.Screen name="index" component={Welcome} />
        <Stack.Screen name="role-select" component={RoleSelect} />
        <Stack.Screen name="home" component={Home} />
        <Stack.Screen name="scan-artist" component={ScanArtist} />
        <Stack.Screen name="scan-collector" component={ScanCollector} />
        <Stack.Screen name="dashboard" component={Dashboard} />
        <Stack.Screen name="artwork" component={Artwork} />
        <Stack.Screen name="profile" component={Profile} />
        <Stack.Screen name="kyc" component={KYC} />
      </Stack.Navigator>
    </NavigationContainer>
  )
}