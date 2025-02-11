"""empty message

Revision ID: 5ae1d250184b
Revises: 0329f9c59f3d
Create Date: 2024-12-02 15:53:34.306384

"""
from typing import Sequence, Union

from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision: str = '5ae1d250184b'
down_revision: Union[str, None] = '0329f9c59f3d'
branch_labels: Union[str, Sequence[str], None] = None
depends_on: Union[str, Sequence[str], None] = None


def upgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('resume', sa.Column('user_id', sa.Integer(), nullable=True))
    op.create_foreign_key(None, 'resume', 'user', ['user_id'], ['id'])
    # ### end Alembic commands ###


def downgrade() -> None:
    # ### commands auto generated by Alembic - please adjust! ###
    op.drop_constraint(None, 'resume', type_='foreignkey')
    op.drop_column('resume', 'user_id')
    # ### end Alembic commands ###
