from aiogram import Bot, Dispatcher, executor, types
import asyncio

bot = Bot(token=BOT_TOKEN)
dp = Dispatcher(bot)

@dp.message_handler(commands=['start'])
async def start_handler(message: types.Message):
    keyboard = types.InlineKeyboardMarkup(row_width=1)
    keyboard.add(
        types.InlineKeyboardButton(text="🎰 Bonos Slots", url="https://track.juga.live/4b8d7b48-284a-41ba-a007-9cb52694ddfb"),
        types.InlineKeyboardButton(text="🏅 Bonos Deportes", url="https://track.juga.live/563eed25-d153-40cd-89f0-16c9979790ce"),
        types.InlineKeyboardButton(text="🎲 Bonos Casino en Vivo", url="https://track.juga.live/0cf84ef0-4180-4e81-a8fb-7a18e437aabe")
    )
    await message.answer("¡Bienvenido a Jugabet Chile! Elige tu bono para empezar a jugar:", reply_markup=keyboard)

if __name__ == '__main__':
    executor.start_polling(dp, skip_updates=True)



BOT_TOKEN = "8180281549:AAHL6nMzLtAorkKKxKA9iDsHhvxEtVdKVfc"
bot = Bot(token=BOT_TOKEN)

async def set_commands():
    commands = [
        types.BotCommand(command="start", description="🚀 Iniciar y descubrir bonos"),
    ]
    await bot.set_my_commands(commands)

if __name__ == '__main__':
    asyncio.run(set_commands())
