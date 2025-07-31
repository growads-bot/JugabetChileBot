from aiogram import Bot, Dispatcher, executor, types

BOT_TOKEN = "8180281549:AAHL6nMzLtAorkKKxKA9iDsHhvxEtVdKVfc"

bot = Bot(token=BOT_TOKEN)
dp = Dispatcher(bot)

# Стартове повідомлення з меню бонусів
@dp.message_handler(commands=['start'])
async def start_menu(message: types.Message):
    keyboard = types.InlineKeyboardMarkup(row_width=2)
    keyboard.add(
        types.InlineKeyboardButton("Bono de Registro", callback_data="bono_registro"),
        types.InlineKeyboardButton("Bono Deportivo", callback_data="bono_deportivo"),
        types.InlineKeyboardButton("Bono Live Casino", callback_data="bono_live")
    )
    await message.answer("¡Bienvenido! Elige tu bono:", reply_markup=keyboard)

# Обробка вибору бонуса
@dp.callback_query_handler(lambda c: c.data and c.data.startswith('bono_'))
async def process_bonus_selection(callback_query: types.CallbackQuery):
    bonus_links = {
        "bono_registro": "https://track.juga.live/4b8d7b48-284a-41ba-a007-9cb52694ddfb",
        "bono_de_
