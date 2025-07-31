from aiogram import Bot, Dispatcher, executor, types

BOT_TOKEN = 'тут_твій_токен_бота'

bot = Bot(token=BOT_TOKEN)
dp = Dispatcher(bot)

@dp.message_handler(commands=['start'])
async def send_welcome(message: types.Message):
    keyboard = types.InlineKeyboardMarkup()
    keyboard.add(types.InlineKeyboardButton("Registrarse en Jugabet", url="https://track.juga.live/4b8d7b48-284a-41ba-a007-9cb52694ddfb"))
    keyboard.add(types.InlineKeyboardButton("Bono deportivo", url="https://track.juga.live/563eed25-d153-40cd-89f0-16c9979790ce"))
    keyboard.add(types.InlineKeyboardButton("Live Casino", url="https://track.juga.live/0cf84ef0-4180-4e81-a8fb-7a18e437aabe"))
    await message.answer("¡Bienvenido a Jugabet Chile! El mejor sitio para juegos y apuestas.", reply_markup=keyboard)

if __name__ == '__main__':
    executor.start_polling(dp)
