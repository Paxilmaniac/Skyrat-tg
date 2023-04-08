import { capitalize, createSearch } from 'common/string';
import { useBackend, useLocalState } from '../backend';
import { Box, Button, Divider, Input, NumberInput, Section, Stack, Tabs } from '../components';
import { Window } from '../layouts';

const buttonWidth = 2;

const TAB2NAME = [
  {
    component: () => ShoppingTab,
  },
  {
    component: () => CheckoutTab,
  },
];

const findAmount = (item_amts, name) => {
  const amount = item_amts.find((item) => item.name === name);
  return amount.amt;
};

const ShoppingTab = (props, context) => {
  const { data, act } = useBackend(context);
  const { credit_type, order_categories, order_datums, item_amts } = data;
  const [shopIndex, setShopIndex] = useLocalState(context, 'shop-index', 1);
  const [searchItem, setSearchItem] = useLocalState(context, 'searchItem', '');
  const search = createSearch(searchItem, (order_datums) => order_datums.name);
  let goods =
    searchItem.length > 0
      ? data.order_datums.filter(search)
      : order_datums.filter((item) => item && item.cat === shopIndex);

  return (
    <Stack fill vertical>
      <Section mb={-1}>
        <Stack.Item>
          <Tabs>
            {order_categories.map((item, key) => (
              <Tabs.Tab
                key={item.id}
                selected={item === shopIndex}
                onClick={() => {
                  setShopIndex(item);

                  if (searchItem.length > 0) {
                    setSearchItem('');
                  }
                }}>
                {item}
              </Tabs.Tab>
            ))}
            <Stack.Item grow>
              <Input
                autoFocus
                ml={5}
                width="150px"
                mt={0.5}
                placeholder="Search item..."
                value={searchItem}
                onInput={(e, value) => {
                  setSearchItem(value);

                  if (value.length > 0) {
                    setShopIndex(1);
                  }
                }}
                fluid
              />
            </Stack.Item>
          </Tabs>
        </Stack.Item>
      </Section>
      <Stack.Item grow>
        <Section fill scrollable>
          <Stack vertical mt={-2}>
            <Divider />
            {goods.map((item) => (
              <Stack.Item key={item}>
                <Stack>
                  <span
                    style={{
                      'vertical-align': 'middle',
                    }}
                  />{' '}
                  <Stack.Item>
                    <Box
                      as="img"
                      m={1}
                      src={`data:image/jpeg;base64,${item.product_icon}`}
                      height="32px"
                      width="48px"
                      style={{
                        '-ms-interpolation-mode': 'nearest-neighbor',
                        'vertical-align': 'middle',
                      }}
                    />
                  </Stack.Item>
                  <Stack.Item>{capitalize(item.name)}</Stack.Item>
                  <Stack.Item grow mt={-1} color="label" fontSize="10px">
                    <Button
                      color="transparent"
                      icon="info"
                      tooltipPosition="right"
                      tooltip={item.desc}
                    />
                    <br />
                  </Stack.Item>
                  <Stack.Item mt={-0.5}>
                    <Box fontSize="10px" color="label" textAlign="right">
                      {item.cost + credit_type + ' per order.'}
                    </Box>
                    <Button
                      ml={2}
                      icon="minus"
                      onClick={() =>
                        act('remove_one', {
                          target: item.ref,
                        })
                      }
                    />
                    <Button
                      icon="plus"
                      onClick={() =>
                        act('add_one', {
                          target: item.ref,
                        })
                      }
                    />
                    <NumberInput
                      value={findAmount(item_amts, item.name) || 0}
                      width="41px"
                      minValue={0}
                      maxValue={20}
                      onChange={(e, value) =>
                        act('cart_set', {
                          target: item.ref,
                          amt: value,
                        })
                      }
                    />
                  </Stack.Item>
                </Stack>
                <Divider />
              </Stack.Item>
            ))}
          </Stack>
        </Section>
      </Stack.Item>
    </Stack>
  );
};

const CheckoutTab = (props, context) => {
  const { data, act } = useBackend(context);
  const { order_datums, total_cost, item_amts } = data;

  const checkout_list = order_datums.filter(
    (food) => food && (findAmount(item_amts, food.name) || 0)
  );
  return (
    <Stack vertical fill>
      <Stack.Item grow>
        <Section fill scrollable>
          <Stack vertical fill>
            <Stack.Item textAlign="center">Checkout list:</Stack.Item>
            <Divider />
            {!checkout_list.length && (
              <>
                <Box align="center" mt="15%" fontSize="40px">
                  Nothing!
                </Box>
                <br />
                <Box align="center" mt={2} fontSize="15px">
                  (Go order something, will ya?)
                </Box>
              </>
            )}
            <Stack.Item grow>
              {checkout_list.map((item) => (
                <Stack.Item key={item}>
                  <Stack>
                    <Stack.Item>{capitalize(item.name)}</Stack.Item>
                    <Stack.Item grow mt={-1} color="label" fontSize="10px">
                      {'"' + item.desc + '"'}
                      <br />
                      <Box textAlign="right">
                        {item.name + ' costs ' + item.cost + ' cr per order.'}
                      </Box>
                    </Stack.Item>
                    <Stack.Item mt={-0.5}>
                      <NumberInput
                        value={findAmount(item_amts, item.name) || 0}
                        width="41px"
                        minValue={0}
                        maxValue={(item.cost > 10 && 50) || 10}
                        onChange={(e, value) =>
                          act('cart_set', {
                            target: item.ref,
                            amt: value,
                          })
                        }
                      />
                    </Stack.Item>
                  </Stack>
                  <Divider />
                </Stack.Item>
              ))}
            </Stack.Item>
          </Stack>
        </Section>
      </Stack.Item>
      <Stack.Item>
        <Section>
          <Stack>
            <Stack.Item grow mt={0.5}>
              Total Cost: {total_cost}
            </Stack.Item>
            <Stack.Item grow textAlign="center">
              <Button
                fluid
                icon="plane-departure"
                content="Purchase"
                tooltip="Your purchases will arrive at cargo."
                tooltipPosition="top"
                onClick={() => act('purchase')}
              />
            </Stack.Item>
          </Stack>
        </Section>
      </Stack.Item>
    </Stack>
  );
};

export const FreeTradeImport = (props, context) => {
  const { act, data } = useBackend(context);
  const { points, self_paid, non_budget } = data;
  const [tabIndex, setTabIndex] = useLocalState(context, 'tab-index', 1);
  const TabComponent = TAB2NAME[tabIndex - 1].component();
  return (
    <Window width={1000} height={600}>
      <Window.Content>
        <Stack vertical fill>
          <Stack.Item>
            <Section fill>
              <Stack textAlign="center">
                <Stack.Item grow={2}>
                  <Button
                    fluid
                    color="green"
                    lineHeight={buttonWidth}
                    icon="cart-plus"
                    content="Shopping"
                    onClick={() => setTabIndex(1)}
                  />
                </Stack.Item>
                <Stack.Item grow={2}>
                  <Button
                    fluid
                    color="green"
                    lineHeight={buttonWidth}
                    icon="dollar-sign"
                    content="Checkout"
                    onClick={() => setTabIndex(2)}
                  />
                </Stack.Item>
              </Stack>
            </Section>
          </Stack.Item>
          <Section>
            <Stack direction="column">
              <Stack.Item grow>
                Currently available balance: {points || 0}
              </Stack.Item>
              {!non_budget && (
                <Stack.Item textAlign="right" fill>
                  <Button
                    ml={65}
                    mt={-4}
                    color={self_paid ? 'green' : 'label'}
                    content={self_paid ? 'Private Order' : 'Budget Order'}
                    onClick={() => act('toggleprivate')}
                  />
                </Stack.Item>
              )}
            </Stack>
          </Section>
          <Stack.Item grow>
            <TabComponent />
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};
