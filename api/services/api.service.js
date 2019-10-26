"use strict";
const ApiGateway = require("moleculer-web");
const ApiService = {
    name: "api",
    mixins: [ApiGateway],
    // More info about settings: https://moleculer.services/docs/0.13/moleculer-web.html
    settings: {
        port: process.env.PORT || 3000,
        routes: [
            {
                path: "/api",
                whitelist: [
                    "**",
                ],
            },
            {
                path: "/auth",
                whitelist: [
                    "**",
                ],
            },
        ],
        // Serve assets from "public" folder
        assets: {
            folder: "public",
        },
    },
};
module.exports = ApiService;
//# sourceMappingURL=api.service.js.map