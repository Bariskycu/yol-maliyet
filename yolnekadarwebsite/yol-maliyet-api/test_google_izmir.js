require('dotenv').config();
const { getRouteInfo } = require('./src/services/directions.service');

async function test() {
    try {
        const routes = await getRouteInfo("Zeytinburnu, Istanbul, Turkey", "Bornova, Izmir, Turkey");
        console.log("--- ROUTES ---");
        routes.forEach((r, i) => {
            console.log(`Route ${i}: "${r.summary}" | Distance: ${r.distanceKm}km | Duration: ${r.durationMin}min | avoidsTolls: ${r.avoidsTolls}`);
        });
    } catch (e) {
        console.error("Test Error:", e.message);
    }
}

test();
