require("dotenv/config");

const { Client } = require("discord.js");

const client = new Client();

client.addListener("ready", () => {
  console.log("Online");
});

const guild = () => client.guilds.cache.get("795307438828027966");

// client.on("message", async (message) => {
//   const { content } = message;

//   if (content.startsWith("+setcriador")) {

//   }
// });

const findChannel = (id) => client.channels.cache.get(id);

client.on("message", async function (message) {
  if (message.content.startsWith("+buraconegro")) {
    guild().members.cache.forEach((member) => {
      if (member.voice.channelID) {
        member.voice.setChannel("813694300147810324");
      }
    });
  }
});

client.on("voiceStateUpdate", async (oldMember, newMember) => {
  const newUserChannel = newMember.channelID;

  const trashId = "813694300147810324";

  if (newUserChannel === trashId) {
    await newMember.member.ban();
  }
});

// client.on("voiceStateUpdate", async (oldMember, newMember) => {
//   const newUserChannel = newMember.channelID;
//   const oldUserChannel = oldMember.channelID;

//   const textChannel = findChannel("795309459533594625");

//   if (!newMember.member.user) return;

//   let voiceChannel;

//   if (newUserChannel === "813683150701199371") {
//     voiceChannel = await createChannel(newMember.member.user, textChannel);

//     await newMember.member.voice.setChannel(voiceChannel.id);
//   } else if (
//     oldUserChannel === "813683150701199371" &&
//     newUserChannel !== "813683150701199371"
//   ) {
//   }

//   client.on("voiceStateUpdate", callListener);

//   async function callListener(oldMember, newMember) {
//     if (!voiceChannel) return;

//     const newUserChannel = newMember.channelID;
//     const oldUserChannel = oldMember.channelID;

//     if (
//       oldUserChannel === voiceChannel.id &&
//       newUserChannel !== voiceChannel.id
//     ) {
//       const server = guild();

//       const channel = server.channels.cache.get(oldUserChannel);

//       const isEmpty = channel.members.size === 0;

//       if (isEmpty) {
//         client.off("voiceStateUpdate", callListener);
//         await channel.delete();
//       }
//     }
//   }
// });

// async function createChannel(user) {
//   const name = `🚬「${user.username}」`;

//   const server = await guild();

//   const permissions = [
//     "KICK_MEMBERS",
//     "MANAGE_NICKNAMES",
//     "DEAFEN_MEMBERS",
//     "ADMINISTRATOR",
//     "MANAGE_CHANNELS",
//     "PRIORITY_SPEAKER",
//     "MANAGE_ROLES",
//   ];

//   const voiceChannel = await server.channels.create(name, {
//     type: "voice",
//     parent: "795309435643363329",
//     permissionOverwrites: [
//       {
//         id: server.roles.everyone,
//         deny: permissions,
//       },
//       {
//         id: user.id,
//         allow: permissions,
//       },
//     ],
//   });

//   return voiceChannel;
// }

client.login(process.env.TOKEN);
