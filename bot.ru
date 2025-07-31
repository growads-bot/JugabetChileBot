from aiogram import Bot, Dispatcher, executor, types

BOT_TOKEN = "8180281549:AAHL6nMzLtAorkKKxKA9iDsHhvxEtVdKVfc"

bot = Bot(token=BOT_TOKEN)
dp = Dispatcher(bot)

# Команда /start — показує кнопку "Ver Bonos"
@dp.message_handler(commands=['start'])
async def start_handler(message: types.Message):
    keyboard = types.InlineKeyboardMarkup()
    keyboard.add(types.InlineKeyboardButton(text="🎁 Ver Bonos", callback_data="show_bonuses"))
    await message.answer("¡Bienvenido a Jugabet Chile! Pulsa el botón para ver los bonos disponibles.", reply_markup=keyboard)

# Обробник натискання на кнопку "Ver Bonos"
@dp.callback_query_handler(lambda c: c.data == "show_bonuses")
async def show_bonuses_handler(callback_query: types.CallbackQuery):
    keyboard = types.InlineKeyboardMarkup(row_width=1)
    keyboard.add(
        types.InlineKeyboardButton("🎰 Bono Slots", url="https://track.juga.live/4b8d7b48-284a-41ba-a007-9cb52694ddfb"),
        types.InlineKeyboardButton("🏅 Bono Deportivo", url="https://track.juga.live/563eed25-d153-40cd-89f0-16c9979790ce"),
        types.InlineKeyboardButton("🎲 Bono Live Casino", url="https://track.juga.live/0cf84ef0-4180-4e81-a8fb-7a18e437aabe")
    )
    # Відповідаємо і оновлюємо повідомлення кнопками бонусів
    await bot.answer_callback_query(callback_query.id)
    await bot.edit_message_text(
        chat_id=callback_query.message.chat.id,
        message_id=callback_query.message.message_id,
        text="Aquí están los bonos disponibles. ¡Elige el que más te guste!",
        reply_markup=keyboard
    )

if __name__ == '__main__':
    executor.start_polling(dp, skip_updates=True)
