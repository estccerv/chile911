const admin = require("firebase-admin/app");
admin.initializeApp();

const userPresenceCloud = require("./user_presence_cloud.js");
exports.userPresenceCloud = userPresenceCloud.userPresenceCloud;
const createUserChile911 = require("./create_user_chile911.js");
exports.createUserChile911 = createUserChile911.createUserChile911;
