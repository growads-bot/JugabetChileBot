from aiogram import Bot, Dispatcher, executor, types
import logging

logging.basicConfig(level=logging.INFO)  # Вмикаємо логування

BOT_TOKEN = "8180281549:AAHL6nMzLtAorkKKxKA9iDsHhvxEtVdKVfc"

bot = Bot(token=BOT_TOKEN)
dp = Dispatcher(bot)

@dp.message_handler(commands=['start'])
async def start_handler(message: types.Message):
    logging.info(f"User {message.from_user.id} started the bot")
    keyboard = types.InlineKeyboardMarkup()
    keyboard.add(types.InlineKeyboardButton(text="🎁 Ver Bonos", callback_data="show_bonuses"))
    await message.answer("¡Bienvenido a Jugabet Chile! Pulsa el botón para ver los bonos disponibles.", reply_markup=keyboard)

@dp.callback_query_handler(lambda c: c.data == "show_bonuses")
async def show_bonuses_handler(callback_query: types.CallbackQuery):
    logging.info(f"User {callback_query.from_user.id} clicked Ver Bonos button")
    keyboard = types.InlineKeyboardMarkup(row_width=1)
    keyboard.add(
        types.InlineKeyboardButton("🎰 Bono Slots", url="https://track.juga.live/4b8d7b48-284a-41ba-a007-9cb52694ddfb"),
        types.InlineKeyboardButton("🏅 Bono Deportivo", url="https://track.juga.live/563eed25-d153-40cd-89f0-16c9979790ce"),
        types.InlineKeyboardButton("🎲 Bono Live Casino", url="https://track.juga.live/0cf84ef0-4180-4e81-a8fb-7a18e437aabe")
    )
    await bot.answer_callback_query(callback_query.id)
    await bot.edit_message_text(
        chat_id=callback_query.message.chat.id,
        message_id=callback_query.message.message_id,
        text="Aquí están los bonos disponibles. ¡Elige el que más te guste!",
        reply_markup=keyboard
    )

if __name__ == '__main__':
    executor.start_polling(dp, skip_updates=True)
