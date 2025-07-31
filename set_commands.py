from aiogram import Bot, types
import asyncio

BOT_TOKEN = "8180281549:AAHL6nMzLtAorkKKxKA9iDsHhvxEtVdKVfc"
bot = Bot(token=BOT_TOKEN)

async def set_commands():
    commands = [
        types.BotCommand(command="start", description="🚀 Iniciar y descubrir bonos"),
    ]
    await bot.set_my_commands(commands)

if __name__ == '__main__':
    asyncio.run(set_commands())
