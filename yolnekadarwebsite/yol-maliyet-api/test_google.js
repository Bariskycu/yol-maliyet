require('dotenv').config();
const { getRouteInfo } = require('./src/services/directions.service');

async function test() {
    try {
        console.log("Using Key:", process.env.GOOGLE_API_KEY ? "Present" : "Missing");
        const routes = await getRouteInfo("Zeytinburnu, Istanbul, Turkey", "Kadıköy, Istanbul, Turkey");
        console.log("--- ROUTES ---");
        routes.forEach((r, i) => {
            console.log(`Route ${i}: "${r.summary}" | Distance: ${r.distanceKm}km | Duration: ${r.durationMin}min`);
        });
    } catch (e) {
        console.error("Test Error:", e.message);
    }
}

test();
